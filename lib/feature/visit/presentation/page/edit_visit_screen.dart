import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/theme/app_colors.dart';
import '../../../../core/database/database.dart';

class EditVisitScreen extends StatefulWidget {
  final Visit visit;

  const EditVisitScreen({super.key, required this.visit});

  @override
  State<EditVisitScreen> createState() => _EditVisitScreenState();
}

class _EditVisitScreenState extends State<EditVisitScreen> {
  final _formKey = GlobalKey<FormState>();
  final _db = Get.find<AppDatabase>();

  late DateTime _visitDate;
  late TextEditingController _weightController;
  late TextEditingController _systolicController;
  late TextEditingController _diastolicController;
  late TextEditingController _heartbeatController;
  late TextEditingController _notesController;

  DateTime? _nextAppointmentDate;
  late TextEditingController _nextAppointmentNotesController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _visitDate = DateTime.fromMillisecondsSinceEpoch(widget.visit.visitDate);
    _weightController = TextEditingController(
      text: widget.visit.weightKg?.toStringAsFixed(1) ?? '',
    );
    _systolicController = TextEditingController(
      text: widget.visit.bloodPressureSystolic?.toString() ?? '',
    );
    _diastolicController = TextEditingController(
      text: widget.visit.bloodPressureDiastolic?.toString() ?? '',
    );
    _heartbeatController = TextEditingController(
      text: widget.visit.babyHeartbeatBpm?.toString() ?? '',
    );
    _notesController = TextEditingController(
      text: widget.visit.generalNotes ?? '',
    );
    _nextAppointmentDate = widget.visit.nextAppointmentDate != null
        ? DateTime.fromMillisecondsSinceEpoch(widget.visit.nextAppointmentDate!)
        : null;
    _nextAppointmentNotesController = TextEditingController(
      text: widget.visit.nextAppointmentNotes ?? '',
    );
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
    }
  }

  Future<void> _selectNextAppointmentDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _nextAppointmentDate ?? DateTime.now().add(const Duration(days: 14)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: _nextAppointmentDate != null
            ? TimeOfDay.fromDateTime(_nextAppointmentDate!)
            : const TimeOfDay(hour: 10, minute: 0),
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

  Future<void> _saveVisit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final now = DateTime.now().millisecondsSinceEpoch;

      await _db.updateVisit(VisitsCompanion(
        id: drift.Value(widget.visit.id),
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
        pregnancyWeekAtVisit: drift.Value(widget.visit.pregnancyWeekAtVisit),
        createdAt: drift.Value(widget.visit.createdAt),
        updatedAt: drift.Value(now),
      ));

      Get.back();
      Get.snackbar(
        'Success',
        'Visit updated successfully',
        backgroundColor: AppColors.success,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update visit: $e',
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
        title: const Text('Edit Visit'),
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
                      if (widget.visit.pregnancyWeekAtVisit != null) ...[
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
                            'Week ${widget.visit.pregnancyWeekAtVisit}',
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
                      Expanded(
                        child: Text(
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
                      ),
                      if (_nextAppointmentDate != null)
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() => _nextAppointmentDate = null);
                          },
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
