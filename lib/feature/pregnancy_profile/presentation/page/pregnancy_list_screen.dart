import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/database/database.dart';
import '../../../../core/helpers/pregnancy_calculator.dart';
import '../../../../routes/app_routes.dart';
import '../../../../widgets/empty_state.dart';

class PregnancyListScreen extends StatefulWidget {
  const PregnancyListScreen({super.key});

  @override
  State<PregnancyListScreen> createState() => _PregnancyListScreenState();
}

class _PregnancyListScreenState extends State<PregnancyListScreen> {
  final _db = Get.find<AppDatabase>();
  String? _activePregnancyId;

  @override
  void initState() {
    super.initState();
    _loadActivePregnancy();
  }

  Future<void> _loadActivePregnancy() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _activePregnancyId = prefs.getString(AppConstants.prefActivePregnancyId);
    });
  }

  Future<void> _setActivePregnancy(String pregnancyId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.prefActivePregnancyId, pregnancyId);
    setState(() {
      _activePregnancyId = pregnancyId;
    });
    Get.snackbar(
      'Switched',
      'Active pregnancy has been changed',
      backgroundColor: AppColors.success,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pregnancies'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(AppRoutes.addPregnancy),
        icon: const Icon(Icons.add),
        label: const Text('Add Pregnancy'),
      ),
      body: StreamBuilder<List<Pregnancy>>(
        stream: _db.watchAllPregnancies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final pregnancies = snapshot.data ?? [];

          if (pregnancies.isEmpty) {
            return EmptyState(
              icon: Icons.child_care_outlined,
              title: 'No pregnancies yet',
              subtitle: 'Start tracking your pregnancy journey',
              actionText: 'Add Pregnancy',
              onAction: () => Get.toNamed(AppRoutes.addPregnancy),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: pregnancies.length,
            itemBuilder: (context, index) {
              final pregnancy = pregnancies[index];
              final isActive = pregnancy.id == _activePregnancyId;
              final status = PregnancyStatus.values[pregnancy.status];

              return _PregnancyCard(
                pregnancy: pregnancy,
                isActive: isActive,
                status: status,
                onTap: () {
                  if (!isActive && status == PregnancyStatus.active) {
                    _setActivePregnancy(pregnancy.id);
                  }
                },
                onEdit: () => Get.toNamed(
                  AppRoutes.pregnancyProfile,
                  arguments: pregnancy.id,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _PregnancyCard extends StatelessWidget {
  final Pregnancy pregnancy;
  final bool isActive;
  final PregnancyStatus status;
  final VoidCallback onTap;
  final VoidCallback onEdit;

  const _PregnancyCard({
    required this.pregnancy,
    required this.isActive,
    required this.status,
    required this.onTap,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final dueDate = pregnancy.dueDate != null
        ? DateTime.fromMillisecondsSinceEpoch(pregnancy.dueDate!)
        : null;

    final lmp = pregnancy.lastMenstrualPeriod != null
        ? DateTime.fromMillisecondsSinceEpoch(pregnancy.lastMenstrualPeriod!)
        : null;

    String? weekInfo;
    double? progress;
    if (lmp != null && status == PregnancyStatus.active) {
      final info = PregnancyCalculator.calculateCurrentWeek(lmp);
      weekInfo = 'Week ${info.weeks}';
      progress = info.weeks / 40;
    }

    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: isActive
            ? BorderSide(color: AppColors.primary, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20.r),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Icon
                  Container(
                    width: 56.w,
                    height: 56.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: _getStatusGradient(status),
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Icon(
                      _getStatusIcon(status),
                      color: Colors.white,
                      size: 28.sp,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  // Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                pregnancy.babyName ?? 'Baby',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            if (isActive)
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Text(
                                  'Active',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        if (dueDate != null)
                          Text(
                            status == PregnancyStatus.completed
                                ? 'Born ${DateFormat('MMMM d, y').format(pregnancy.deliveryDate != null ? DateTime.fromMillisecondsSinceEpoch(pregnancy.deliveryDate!) : dueDate)}'
                                : 'Due ${DateFormat('MMMM d, y').format(dueDate)}',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.textSecondary,
                            ),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onEdit,
                    icon: Icon(
                      Icons.edit_outlined,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              if (weekInfo != null && progress != null) ...[
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Text(
                      weekInfo,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: LinearProgressIndicator(
                          value: progress.clamp(0.0, 1.0),
                          backgroundColor: AppColors.primaryLight,
                          valueColor: AlwaysStoppedAnimation(AppColors.primary),
                          minHeight: 6.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      '${(progress * 100).round()}%',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
              if (status != PregnancyStatus.active) ...[
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(status).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    status.displayName,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: _getStatusColor(status),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  List<Color> _getStatusGradient(PregnancyStatus status) {
    switch (status) {
      case PregnancyStatus.active:
        return AppColors.primaryGradient;
      case PregnancyStatus.completed:
        return [AppColors.accent3, AppColors.accent1];
      case PregnancyStatus.archived:
        return [AppColors.textHint, AppColors.textSecondary];
    }
  }

  IconData _getStatusIcon(PregnancyStatus status) {
    switch (status) {
      case PregnancyStatus.active:
        return Icons.pregnant_woman;
      case PregnancyStatus.completed:
        return Icons.child_care;
      case PregnancyStatus.archived:
        return Icons.archive_outlined;
    }
  }

  Color _getStatusColor(PregnancyStatus status) {
    switch (status) {
      case PregnancyStatus.active:
        return AppColors.primary;
      case PregnancyStatus.completed:
        return AppColors.success;
      case PregnancyStatus.archived:
        return AppColors.textSecondary;
    }
  }
}
