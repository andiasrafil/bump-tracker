import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/database/database.dart';
import '../../../../core/helpers/pregnancy_calculator.dart';

class PregnancyProfileScreen extends StatefulWidget {
  final String pregnancyId;

  const PregnancyProfileScreen({super.key, required this.pregnancyId});

  @override
  State<PregnancyProfileScreen> createState() => _PregnancyProfileScreenState();
}

class _PregnancyProfileScreenState extends State<PregnancyProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _db = Get.find<AppDatabase>();

  Pregnancy? _pregnancy;
  bool _isEditing = false;
  bool _isLoading = false;

  DateTime? _lastMenstrualPeriod;
  DateTime? _dueDate;
  DateTime? _deliveryDate;

  final _babyNameController = TextEditingController();
  final _doctorNameController = TextEditingController();
  final _hospitalNameController = TextEditingController();
  final _notesController = TextEditingController();

  PregnancyStatus _status = PregnancyStatus.active;

  @override
  void initState() {
    super.initState();
    _loadPregnancy();
  }

  Future<void> _loadPregnancy() async {
    final pregnancy = await _db.getPregnancyById(widget.pregnancyId);
    if (pregnancy != null) {
      setState(() {
        _pregnancy = pregnancy;
        _status = PregnancyStatus.values[pregnancy.status];
        _lastMenstrualPeriod = pregnancy.lastMenstrualPeriod != null
            ? DateTime.fromMillisecondsSinceEpoch(pregnancy.lastMenstrualPeriod!)
            : null;
        _dueDate = pregnancy.dueDate != null
            ? DateTime.fromMillisecondsSinceEpoch(pregnancy.dueDate!)
            : null;
        _deliveryDate = pregnancy.deliveryDate != null
            ? DateTime.fromMillisecondsSinceEpoch(pregnancy.deliveryDate!)
            : null;
        _babyNameController.text = pregnancy.babyName ?? '';
        _doctorNameController.text = pregnancy.doctorName ?? '';
        _hospitalNameController.text = pregnancy.hospitalName ?? '';
        _notesController.text = pregnancy.notes ?? '';
      });
    }
  }

  @override
  void dispose() {
    _babyNameController.dispose();
    _doctorNameController.dispose();
    _hospitalNameController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final now = DateTime.now().millisecondsSinceEpoch;

      await _db.updatePregnancy(PregnanciesCompanion(
        id: drift.Value(widget.pregnancyId),
        lastMenstrualPeriod: drift.Value(_lastMenstrualPeriod?.millisecondsSinceEpoch),
        dueDate: drift.Value(_dueDate?.millisecondsSinceEpoch),
        deliveryDate: drift.Value(_deliveryDate?.millisecondsSinceEpoch),
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
        status: drift.Value(_status.index),
        createdAt: drift.Value(_pregnancy!.createdAt),
        updatedAt: drift.Value(now),
      ));

      setState(() => _isEditing = false);
      _loadPregnancy();

      Get.snackbar(
        'Saved',
        'Pregnancy updated successfully',
        backgroundColor: AppColors.success,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to save changes: $e',
        backgroundColor: AppColors.error,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Pregnancy'),
        content: const Text(
          'Are you sure you want to delete this pregnancy? All associated data (visits, medications, etc.) will be permanently deleted.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _db.deletePregnancy(widget.pregnancyId);

      // If this was the active pregnancy, clear it
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getString(AppConstants.prefActivePregnancyId) == widget.pregnancyId) {
        await prefs.remove(AppConstants.prefActivePregnancyId);
        // Set another pregnancy as active if available
        final pregnancies = await _db.getAllPregnancies();
        if (pregnancies.isNotEmpty) {
          await prefs.setString(AppConstants.prefActivePregnancyId, pregnancies.first.id);
        }
      }

      Get.back();
      Get.snackbar(
        'Deleted',
        'Pregnancy deleted successfully',
        backgroundColor: AppColors.success,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_pregnancy == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Pregnancy' : 'Pregnancy Details'),
        actions: [
          if (_isEditing)
            TextButton(
              onPressed: _isLoading ? null : _saveChanges,
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
            )
          else
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => setState(() => _isEditing = true),
            ),
          if (!_isEditing)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              onPressed: _confirmDelete,
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
              // Summary Card
              if (!_isEditing) _buildSummaryCard(),

              if (_isEditing) ...[
                // Baby Name
                _buildSectionTitle('Baby\'s Name'),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: _babyNameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter baby\'s name or nickname',
                    prefixIcon: Icon(Icons.child_care),
                  ),
                ),

                SizedBox(height: 24.h),

                // Status
                _buildSectionTitle('Status'),
                SizedBox(height: 12.h),
                _buildStatusSelector(),

                SizedBox(height: 24.h),

                // Dates
                _buildSectionTitle('Important Dates'),
                SizedBox(height: 8.h),
                _buildDateField(
                  label: 'Last Menstrual Period',
                  date: _lastMenstrualPeriod,
                  onSelect: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _lastMenstrualPeriod ?? DateTime.now().subtract(const Duration(days: 60)),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) {
                      setState(() {
                        _lastMenstrualPeriod = date;
                        _dueDate = PregnancyCalculator.calculateDueDate(date);
                      });
                    }
                  },
                ),
                SizedBox(height: 12.h),
                _buildDateField(
                  label: 'Due Date',
                  date: _dueDate,
                  onSelect: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _dueDate ?? DateTime.now().add(const Duration(days: 200)),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                    );
                    if (date != null) {
                      setState(() => _dueDate = date);
                    }
                  },
                ),
                if (_status == PregnancyStatus.completed) ...[
                  SizedBox(height: 12.h),
                  _buildDateField(
                    label: 'Delivery Date',
                    date: _deliveryDate,
                    onSelect: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _deliveryDate ?? DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (date != null) {
                        setState(() => _deliveryDate = date);
                      }
                    },
                  ),
                ],

                SizedBox(height: 24.h),

                // Healthcare Provider
                _buildSectionTitle('Healthcare Provider'),
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
                _buildSectionTitle('Notes'),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: _notesController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hintText: 'Any additional notes...',
                  ),
                ),
              ] else ...[
                // View Mode - Details
                SizedBox(height: 24.h),
                _buildDetailSection('Healthcare Provider', [
                  if (_pregnancy!.doctorName != null)
                    _buildDetailRow(Icons.person, 'Doctor', _pregnancy!.doctorName!),
                  if (_pregnancy!.hospitalName != null)
                    _buildDetailRow(Icons.local_hospital, 'Hospital', _pregnancy!.hospitalName!),
                ]),

                if (_pregnancy!.notes != null && _pregnancy!.notes!.isNotEmpty) ...[
                  SizedBox(height: 24.h),
                  _buildDetailSection('Notes', [
                    Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Text(
                        _pregnancy!.notes!,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.textPrimary,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ]),
                ],
              ],

              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryCard() {
    String? weekInfo;
    double? progress;

    if (_lastMenstrualPeriod != null && _status == PregnancyStatus.active) {
      final info = PregnancyCalculator.calculateCurrentWeek(_lastMenstrualPeriod!);
      weekInfo = 'Week ${info.weeks}, Day ${info.days}';
      progress = (info.weeks * 7 + info.days) / (40 * 7);
    }

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.primaryGradient,
        ),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 64.w,
                height: 64.w,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Icon(
                  _status == PregnancyStatus.completed
                      ? Icons.child_care
                      : Icons.pregnant_woman,
                  color: Colors.white,
                  size: 36.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _pregnancy!.babyName ?? 'Baby',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        _status.displayName,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          if (weekInfo != null) ...[
            Text(
              weekInfo,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 12.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: (progress ?? 0).clamp(0.0, 1.0),
                backgroundColor: Colors.white.withValues(alpha: 0.2),
                valueColor: const AlwaysStoppedAnimation(Colors.white),
                minHeight: 8.h,
              ),
            ),
            SizedBox(height: 8.h),
          ],
          if (_dueDate != null)
            Text(
              _status == PregnancyStatus.completed && _deliveryDate != null
                  ? 'Born ${DateFormat('MMMM d, y').format(_deliveryDate!)}'
                  : 'Due ${DateFormat('MMMM d, y').format(_dueDate!)}',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
        ],
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

  Widget _buildStatusSelector() {
    return Row(
      children: PregnancyStatus.values.map((status) {
        final isSelected = _status == status;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: status != PregnancyStatus.archived ? 8.w : 0,
            ),
            child: InkWell(
              onTap: () => setState(() => _status = status),
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  status.displayName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? Colors.white : AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDateField({
    required String label,
    required DateTime? date,
    required VoidCallback onSelect,
  }) {
    return InkWell(
      onTap: onSelect,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.inputBackground,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: AppColors.primary, size: 20.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    date != null
                        ? DateFormat('MMMM d, y').format(date)
                        : 'Not set',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: date != null
                          ? AppColors.textPrimary
                          : AppColors.textHint,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    if (children.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(title),
        SizedBox(height: 12.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 20.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
