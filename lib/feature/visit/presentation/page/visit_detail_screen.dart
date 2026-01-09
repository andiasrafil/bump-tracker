import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/database/database.dart';
import '../../../../routes/app_routes.dart';
import '../../../../widgets/mood_picker.dart';

class VisitDetailScreen extends StatelessWidget {
  final String visitId;

  const VisitDetailScreen({super.key, required this.visitId});

  @override
  Widget build(BuildContext context) {
    final db = Get.find<AppDatabase>();

    return FutureBuilder<Visit?>(
      future: db.getVisitById(visitId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final visit = snapshot.data;
        if (visit == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Visit Details')),
            body: const Center(child: Text('Visit not found')),
          );
        }

        final visitDate = DateTime.fromMillisecondsSinceEpoch(visit.visitDate);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              visit.pregnancyWeekAtVisit != null
                  ? 'Week ${visit.pregnancyWeekAtVisit} Visit'
                  : 'Visit Details',
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => Get.toNamed(
                  AppRoutes.editVisit,
                  arguments: visit,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _confirmDelete(context, db, visit),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date Card
                _buildInfoCard(
                  icon: Icons.calendar_today,
                  title: 'Visit Date',
                  value: DateFormat('EEEE, MMMM d, y').format(visitDate),
                  color: AppColors.primary,
                ),

                // Mood Section
                if (visit.mood != null) ...[
                  SizedBox(height: 16.h),
                  Text(
                    'How I was feeling',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  MoodDisplay(
                    moodIndex: visit.mood!,
                    size: 40,
                  ),
                ],

                SizedBox(height: 16.h),

                // Measurements Section
                Text(
                  'Measurements',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),

                Row(
                  children: [
                    Expanded(
                      child: _buildMeasurementCard(
                        icon: Icons.monitor_weight,
                        label: 'Weight',
                        value: visit.weightKg != null
                            ? '${visit.weightKg!.toStringAsFixed(1)} kg'
                            : 'Not recorded',
                        color: AppColors.chartWeight,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: _buildMeasurementCard(
                        icon: Icons.favorite,
                        label: 'Blood Pressure',
                        value: visit.bloodPressureSystolic != null
                            ? '${visit.bloodPressureSystolic}/${visit.bloodPressureDiastolic} mmHg'
                            : 'Not recorded',
                        color: AppColors.chartBloodPressureSystolic,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 12.h),

                _buildMeasurementCard(
                  icon: Icons.favorite_border,
                  label: 'Baby Heartbeat',
                  value: visit.babyHeartbeatBpm != null
                      ? '${visit.babyHeartbeatBpm} bpm'
                      : 'Not recorded',
                  color: AppColors.chartHeartbeat,
                  fullWidth: true,
                ),

                // Notes Section
                if (visit.generalNotes != null && visit.generalNotes!.isNotEmpty) ...[
                  SizedBox(height: 24.h),
                  Text(
                    'Notes',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      visit.generalNotes!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textPrimary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],

                // Next Appointment Section
                if (visit.nextAppointmentDate != null) ...[
                  SizedBox(height: 24.h),
                  Text(
                    'Next Appointment',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  _buildInfoCard(
                    icon: Icons.event,
                    title: 'Scheduled',
                    value: DateFormat('EEE, MMM d, y \'at\' h:mm a').format(
                      DateTime.fromMillisecondsSinceEpoch(visit.nextAppointmentDate!),
                    ),
                    color: AppColors.info,
                    subtitle: visit.nextAppointmentNotes,
                  ),
                ],

                // Ultrasound Images Section
                SizedBox(height: 24.h),
                _UltrasoundSection(visitId: visitId),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    String? subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, color: color, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMeasurementCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    bool fullWidth = false,
  }) {
    return Container(
      width: fullWidth ? double.infinity : null,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, AppDatabase db, Visit visit) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Visit'),
        content: const Text(
            'Are you sure you want to delete this visit? This action cannot be undone.'),
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
      await db.deleteVisit(visit.id);
      Get.back();
      Get.snackbar(
        'Deleted',
        'Visit deleted successfully',
        backgroundColor: AppColors.success,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}

class _UltrasoundSection extends StatelessWidget {
  final String visitId;

  const _UltrasoundSection({required this.visitId});

  @override
  Widget build(BuildContext context) {
    final db = Get.find<AppDatabase>();

    return FutureBuilder<List<UltrasoundImage>>(
      future: db.getUltrasoundsByVisit(visitId),
      builder: (context, snapshot) {
        final images = snapshot.data ?? [];

        if (images.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ultrasound Images',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              height: 120.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  final image = images[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.file(
                        File(image.imagePath),
                        width: 120.w,
                        height: 120.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 120.w,
                            height: 120.h,
                            color: AppColors.inputBackground,
                            child: Icon(
                              Icons.broken_image,
                              color: AppColors.textHint,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
