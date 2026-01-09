import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' as drift;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/database/database.dart';
import '../../../../core/helpers/pregnancy_calculator.dart';
import '../../../../core/helpers/file_helper.dart';

class AddVisitScreen extends StatefulWidget {
  const AddVisitScreen({super.key});

  @override
  State<AddVisitScreen> createState() => _AddVisitScreenState();
}

class _AddVisitScreenState extends State<AddVisitScreen> {
  final _formKey = GlobalKey<FormState>();
  final _db = Get.find<AppDatabase>();

  DateTime _visitDate = DateTime.now();
  final _weightController = TextEditingController();
  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  final _heartbeatController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime? _nextAppointmentDate;
  final _nextAppointmentNotesController = TextEditingController();

  // Ultrasound images
  final List<File> _selectedImages = [];

  bool _isLoading = false;
  int? _currentPregnancyWeek;

  @override
  void initState() {
    super.initState();
    _loadPregnancyWeek();
  }

  Future<void> _loadPregnancyWeek() async {
    final prefs = await SharedPreferences.getInstance();
    final pregnancyId = prefs.getString(AppConstants.prefActivePregnancyId);
    if (pregnancyId != null) {
      final pregnancies = await _db.getAllPregnancies();
      final pregnancy = pregnancies.firstWhereOrNull((p) => p.id == pregnancyId);
      if (pregnancy?.lastMenstrualPeriod != null) {
        final lmp = DateTime.fromMillisecondsSinceEpoch(pregnancy!.lastMenstrualPeriod!);
        final weekInfo = PregnancyCalculator.calculateWeekAtDate(lmp, _visitDate);
        setState(() => _currentPregnancyWeek = weekInfo.weeks);
      }
    }
  }

  @override
  void dispose() {
    _weightController.dispose();
    _systolicController.dispose();
    _diastolicController.dispose();
    _heartbeatController.dispose();
    _notesController.dispose();
    _nextAppointmentNotesController.dispose();
    super.dispose();
  }

  Future<void> _selectVisitDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _visitDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() => _visitDate = date);
      _loadPregnancyWeek();
    }
  }

  Future<void> _selectNextAppointmentDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 14)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 10, minute: 0),
      );
      if (time != null) {
        setState(() {
          _nextAppointmentDate = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () async {
                Navigator.pop(context);
                final image = await FileHelper.pickImageFromCamera();
                if (image != null) {
                  setState(() => _selectedImages.add(image));
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () async {
                Navigator.pop(context);
                final image = await FileHelper.pickImageFromGallery();
                if (image != null) {
                  setState(() => _selectedImages.add(image));
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Choose Multiple'),
              onTap: () async {
                Navigator.pop(context);
                final images = await FileHelper.pickMultipleImages();
                if (images.isNotEmpty) {
                  setState(() => _selectedImages.addAll(images));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _removeImage(int index) {
    setState(() => _selectedImages.removeAt(index));
  }

  Future<void> _saveVisit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final uuid = const Uuid();
      final now = DateTime.now().millisecondsSinceEpoch;
      final visitId = uuid.v4();

      // Save the visit
      await _db.insertVisit(VisitsCompanion(
        id: drift.Value(visitId),
        visitDate: drift.Value(_visitDate.millisecondsSinceEpoch),
        weightKg: drift.Value(_weightController.text.isNotEmpty
            ? double.tryParse(_weightController.text)
            : null),
        bloodPressureSystolic: drift.Value(_systolicController.text.isNotEmpty
            ? int.tryParse(_systolicController.text)
            : null),
        bloodPressureDiastolic: drift.Value(_diastolicController.text.isNotEmpty
            ? int.tryParse(_diastolicController.text)
            : null),
        babyHeartbeatBpm: drift.Value(_heartbeatController.text.isNotEmpty
            ? int.tryParse(_heartbeatController.text)
            : null),
        generalNotes: drift.Value(_notesController.text.isNotEmpty
            ? _notesController.text
            : null),
        nextAppointmentDate: drift.Value(_nextAppointmentDate?.millisecondsSinceEpoch),
        nextAppointmentNotes: drift.Value(
            _nextAppointmentNotesController.text.isNotEmpty
                ? _nextAppointmentNotesController.text
                : null),
        pregnancyWeekAtVisit: drift.Value(_currentPregnancyWeek),
        createdAt: drift.Value(now),
        updatedAt: drift.Value(now),
      ));

      // Save ultrasound images
      for (final image in _selectedImages) {
        final savedPath = await FileHelper.saveUltrasoundImage(image);
        await _db.insertUltrasound(UltrasoundImagesCompanion(
          id: drift.Value(uuid.v4()),
          imagePath: drift.Value(savedPath),
          imageDate: drift.Value(_visitDate.millisecondsSinceEpoch),
          pregnancyWeek: drift.Value(_currentPregnancyWeek),
          visitId: drift.Value(visitId),
          createdAt: drift.Value(now),
          updatedAt: drift.Value(now),
        ));
      }

      Get.back();
      Get.snackbar(
        'Success',
        'Visit recorded successfully',
        backgroundColor: AppColors.success,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save visit: $e',
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Visit'),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _saveVisit,
            child: _isLoading
                ? SizedBox(
                    width: 20.w,
                    height: 20.w,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Visit Date
              _buildSectionTitle('Visit Date'),
              InkWell(
                onTap: _selectVisitDate,
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: AppColors.primary),
                      SizedBox(width: 12.w),
                      Text(
                        DateFormat('EEEE, MMMM d, y').format(_visitDate),
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      if (_currentPregnancyWeek != null) ...[
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'Week $_currentPregnancyWeek',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Measurements Section
              _buildSectionTitle('Measurements'),
              SizedBox(height: 12.h),

              // Weight
              TextFormField(
                controller: _weightController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  hintText: 'e.g., 65.5',
                  prefixIcon: Icon(Icons.monitor_weight),
                  suffixText: 'kg',
                ),
              ),

              SizedBox(height: 16.h),

              // Blood Pressure
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _systolicController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Systolic',
                        hintText: '120',
                        prefixIcon: Icon(Icons.favorite),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    '/',
                    style: TextStyle(fontSize: 24.sp),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextFormField(
                      controller: _diastolicController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Diastolic',
                        hintText: '80',
                        suffixText: 'mmHg',
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Baby Heartbeat
              TextFormField(
                controller: _heartbeatController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Baby Heartbeat',
                  hintText: 'e.g., 145',
                  prefixIcon: Icon(Icons.favorite_border),
                  suffixText: 'bpm',
                ),
              ),

              SizedBox(height: 24.h),

              // Ultrasound Images Section
              _buildSectionTitle('Ultrasound Images'),
              SizedBox(height: 12.h),

              // Image picker and preview
              if (_selectedImages.isEmpty)
                InkWell(
                  onTap: _pickImage,
                  borderRadius: BorderRadius.circular(12.r),
                  child: Container(
                    width: double.infinity,
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: AppColors.inputBackground,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: AppColors.primaryLight,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 40.sp,
                          color: AppColors.primary,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Add ultrasound images',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Column(
                  children: [
                    SizedBox(
                      height: 120.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _selectedImages.length + 1,
                        itemBuilder: (context, index) {
                          if (index == _selectedImages.length) {
                            // Add more button
                            return Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: InkWell(
                                onTap: _pickImage,
                                borderRadius: BorderRadius.circular(12.r),
                                child: Container(
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.inputBackground,
                                    borderRadius: BorderRadius.circular(12.r),
                                    border: Border.all(
                                      color: AppColors.primaryLight,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add,
                                        size: 32.sp,
                                        color: AppColors.primary,
                                      ),
                                      Text(
                                        'Add more',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }

                          return Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.file(
                                    _selectedImages[index],
                                    width: 100.w,
                                    height: 120.h,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () => _removeImage(index),
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: AppColors.error,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        size: 16.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${_selectedImages.length} image(s) selected',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),

              SizedBox(height: 24.h),

              // Notes
              _buildSectionTitle('Notes'),
              SizedBox(height: 12.h),
              TextFormField(
                controller: _notesController,
                maxLines: 4,
                decoration: const InputDecoration(
                  hintText: 'Add any notes about this visit...',
                  alignLabelWithHint: true,
                ),
              ),

              SizedBox(height: 24.h),

              // Next Appointment
              _buildSectionTitle('Next Appointment (Optional)'),
              SizedBox(height: 12.h),
              InkWell(
                onTap: _selectNextAppointmentDate,
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.event, color: AppColors.primary),
                      SizedBox(width: 12.w),
                      Text(
                        _nextAppointmentDate != null
                            ? DateFormat('EEE, MMM d, y \'at\' h:mm a')
                                .format(_nextAppointmentDate!)
                            : 'Set next appointment',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: _nextAppointmentDate != null
                              ? AppColors.textPrimary
                              : AppColors.textHint,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (_nextAppointmentDate != null) ...[
                SizedBox(height: 12.h),
                TextFormField(
                  controller: _nextAppointmentNotesController,
                  decoration: const InputDecoration(
                    hintText: 'Notes for next appointment...',
                  ),
                ),
              ],

              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }
}
