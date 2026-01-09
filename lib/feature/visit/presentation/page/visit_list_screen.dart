import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/database/database.dart';
import '../../../../routes/app_routes.dart';
import '../../../../widgets/mood_picker.dart';
import '../../../../widgets/empty_state.dart';

class VisitListScreen extends StatefulWidget {
  const VisitListScreen({super.key});

  @override
  State<VisitListScreen> createState() => _VisitListScreenState();
}

class _VisitListScreenState extends State<VisitListScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Visit History')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addVisit),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Visit>>(
        stream: _db.watchAllVisits(pregnancyId: _activePregnancyId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final visits = snapshot.data ?? [];

          if (visits.isEmpty) {
            return EmptyState(
              icon: Icons.event_note_outlined,
              title: 'No visits recorded yet',
              subtitle: 'Record your hospital visits to track your pregnancy journey',
              actionText: 'Add First Visit',
              onAction: () => Get.toNamed(AppRoutes.addVisit),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: visits.length,
            itemBuilder: (context, index) {
              final visit = visits[index];
              final visitDate =
                  DateTime.fromMillisecondsSinceEpoch(visit.visitDate);

              return Card(
                margin: EdgeInsets.only(bottom: 12.h),
                child: InkWell(
                  onTap: () => Get.toNamed(
                    AppRoutes.visitDetail,
                    arguments: visit.id,
                  ),
                  borderRadius: BorderRadius.circular(20.r),
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Row(
                      children: [
                        // Date badge with mood
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 56.w,
                              height: 56.w,
                              decoration: BoxDecoration(
                                color: AppColors.primaryLight,
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${visitDate.day}',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('MMM').format(visitDate),
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Mood badge
                            if (visit.mood != null)
                              Positioned(
                                right: -6,
                                bottom: -6,
                                child: MoodBadge(
                                  moodIndex: visit.mood!,
                                  size: 28,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(width: 16.w),
                        // Visit info
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    visit.pregnancyWeekAtVisit != null
                                        ? 'Week ${visit.pregnancyWeekAtVisit} Visit'
                                        : 'Hospital Visit',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  if (visit.pregnancyWeekAtVisit != null) ...[
                                    SizedBox(width: 8.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.accent1.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(6.r),
                                      ),
                                      child: Text(
                                        _getTrimester(visit.pregnancyWeekAtVisit!),
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.accent1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                DateFormat('EEEE, MMMM d, y').format(visitDate),
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.textHint,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _getTrimester(int week) {
    if (week <= 12) return 'T1';
    if (week <= 27) return 'T2';
    return 'T3';
  }
}
