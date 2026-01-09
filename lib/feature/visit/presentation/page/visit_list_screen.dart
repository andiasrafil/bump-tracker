import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/database/database.dart';
import '../../../../routes/app_routes.dart';

class VisitListScreen extends StatelessWidget {
  const VisitListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Get.find<AppDatabase>();

    return Scaffold(
      appBar: AppBar(title: const Text('Visit History')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(AppRoutes.addVisit),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Visit>>(
        stream: db.watchAllVisits(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final visits = snapshot.data ?? [];

          if (visits.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_note_outlined,
                    size: 64.sp,
                    color: AppColors.textHint,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No visits recorded yet',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
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
                child: ListTile(
                  leading: Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${visitDate.day}',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          DateFormat('MMM').format(visitDate),
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    visit.pregnancyWeekAtVisit != null
                        ? 'Week ${visit.pregnancyWeekAtVisit} Visit'
                        : 'Hospital Visit',
                  ),
                  subtitle: Text(DateFormat('EEEE, MMMM d, y').format(visitDate)),
                  trailing: const Icon(Icons.chevron_right),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
