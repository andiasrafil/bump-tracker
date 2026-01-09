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

class AddPregnancyScreen extends StatefulWidget {
  const AddPregnancyScreen({super.key});

  @override
  State<AddPregnancyScreen> createState() => _AddPregnancyScreenState();
}

class _AddPregnancyScreenState extends State<AddPregnancyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _db = Get.find<AppDatabase>();

  DateTime? _lastMenstrualPeriod;
  DateTime? _dueDate;
  bool _calculateFromLMP = true;

  final _babyNameController = TextEditingController();
  final _doctorNameController = TextEditingController();
  final _hospitalNameController = TextEditingController();
  final _notesController = TextEditingController();

  bool _isLoading = false;
  bool _setAsActive = true;

  @override
  void dispose() {
    _babyNameController.dispose();
    _doctorNameController.dispose();
    _hospitalNameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _calculateDueDate() {
    if (_lastMenstrualPeriod != null) {
      setState(() {
        _dueDate = PregnancyCalculator.calculateDueDate(_lastMenstrualPeriod!);
      });
    }
  }

  Future<void> _selectLMP() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _lastMenstrualPeriod ?? DateTime.now().subtract(const Duration(days: 60)),
      firstDate: DateTime.now().subtract(const Duration(days: 300)),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        _lastMenstrualPeriod = date;
        if (_calculateFromLMP) {
          _calculateDueDate();
        }
      });
    }
  }

  Future<void> _selectDueDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now().add(const Duration(days: 200)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 300)),
    );
    if (date != null) {
      setState(() {
        _dueDate = date;
      });
    }
  }

  Future<void> _savePregnancy() async {
    if (!_formKey.currentState!.validate()) return;

    if (_dueDate == null) {
      Get.snackbar(
        'Missing Information',
        'Please select a due date or last menstrual period',
        backgroundColor: AppColors.warning,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final uuid = const Uuid();
      final now = DateTime.now().millisecondsSinceEpoch;
      final pregnancyId = uuid.v4();

      await _db.insertPregnancy(PregnanciesCompanion(
        id: drift.Value(pregnancyId),
        lastMenstrualPeriod: drift.Value(_lastMenstrualPeriod?.millisecondsSinceEpoch),
        dueDate: drift.Value(_dueDate?.millisecondsSinceEpoch),
        babyName: drift.Value(_babyNameController.text.isNotEmpty
            ? _babyNameController.text
            : null),
        doctorName: drift.Value(_doctorNameController.text.isNotEmpty
            ? _doctorNameController.text
            : null),
        hospitalName: drift.Value(_hospitalNameController.text.isNotEmpty
            ? _hospitalNameController.text
            : null),
        notes: drift.Value(_notesController.text.isNotEmpty
            ? _notesController.text
            : null),
        status: const drift.Value(0), // Active
        createdAt: drift.Value(now),
        updatedAt: drift.Value(now),
      ));

      if (_setAsActive) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppConstants.prefActivePregnancyId, pregnancyId);
      }

      Get.back();
      Get.snackbar(
        'Success',
        'Pregnancy added successfully!',
        backgroundColor: AppColors.success,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save pregnancy: $e',
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
        title: const Text('Add Pregnancy'),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _savePregnancy,
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
              // Baby Name Section
              _buildSectionTitle('Baby\'s Name (Optional)'),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _babyNameController,
                decoration: const InputDecoration(
                  hintText: 'Enter baby\'s name or nickname',
                  prefixIcon: Icon(Icons.child_care),
                ),
              ),

              SizedBox(height: 24.h),

              // Date Calculation Method
              _buildSectionTitle('How would you like to calculate?'),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Expanded(
                    child: _buildOptionCard(
                      title: 'From LMP',
                      subtitle: 'Last menstrual period',
                      isSelected: _calculateFromLMP,
                      onTap: () => setState(() => _calculateFromLMP = true),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildOptionCard(
                      title: 'Due Date',
                      subtitle: 'I know my due date',
                      isSelected: !_calculateFromLMP,
                      onTap: () => setState(() => _calculateFromLMP = false),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Date Selection
              if (_calculateFromLMP) ...[
                _buildSectionTitle('Last Menstrual Period'),
                SizedBox(height: 8.h),
                _buildDateSelector(
                  label: 'Select LMP date',
                  date: _lastMenstrualPeriod,
                  onTap: _selectLMP,
                ),
                if (_dueDate != null) ...[
                  SizedBox(height: 12.h),
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColors.accent3.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: AppColors.accent3),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            'Estimated due date: ${DateFormat('MMMM d, y').format(_dueDate!)}',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ] else ...[
                _buildSectionTitle('Due Date'),
                SizedBox(height: 8.h),
                _buildDateSelector(
                  label: 'Select due date',
                  date: _dueDate,
                  onTap: _selectDueDate,
                ),
              ],

              SizedBox(height: 24.h),

              // Doctor & Hospital
              _buildSectionTitle('Healthcare Provider (Optional)'),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _doctorNameController,
                decoration: const InputDecoration(
                  hintText: 'Doctor\'s name',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 12.h),
              TextFormField(
                controller: _hospitalNameController,
                decoration: const InputDecoration(
                  hintText: 'Hospital or clinic name',
                  prefixIcon: Icon(Icons.local_hospital),
                ),
              ),

              SizedBox(height: 24.h),

              // Notes
              _buildSectionTitle('Notes (Optional)'),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Any additional notes...',
                ),
              ),

              SizedBox(height: 24.h),

              // Set as Active
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.primaryLight,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Set as active pregnancy',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Text(
                            'Start tracking this pregnancy now',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: _setAsActive,
                      onChanged: (value) => setState(() => _setAsActive = value),
                      activeColor: AppColors.primary,
                    ),
                  ],
                ),
              ),

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

  Widget _buildOptionCard({
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : AppColors.inputBackground,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11.sp,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: AppColors.primary),
            SizedBox(width: 12.w),
            Text(
              date != null
                  ? DateFormat('EEEE, MMMM d, y').format(date)
                  : label,
              style: TextStyle(
                fontSize: 16.sp,
                color: date != null ? AppColors.textPrimary : AppColors.textHint,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
