import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/database/database.dart';
import '../../../../core/helpers/pregnancy_calculator.dart';
import '../../../../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AppDatabase _db = Get.find<AppDatabase>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildDashboard(),
          _buildVisitsTab(),
          _buildGalleryTab(),
          _buildMedicationsTab(),
          _buildSettingsTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note_outlined),
            activeIcon: Icon(Icons.event_note),
            label: 'Visits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library_outlined),
            activeIcon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medication_outlined),
            activeIcon: Icon(Icons.medication),
            label: 'Meds',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 0 || _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: () => Get.toNamed(AppRoutes.addVisit),
              child: const Icon(Icons.add),
            )
          : null,
    );
  }

  Widget _buildDashboard() {
    return StreamBuilder<Pregnancy?>(
      stream: _db.watchActivePregnancy(),
      builder: (context, snapshot) {
        final pregnancy = snapshot.data;

        if (pregnancy == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final lmp = pregnancy.lastMenstrualPeriod != null
            ? DateTime.fromMillisecondsSinceEpoch(pregnancy.lastMenstrualPeriod!)
            : null;
        final dueDate = pregnancy.dueDate != null
            ? DateTime.fromMillisecondsSinceEpoch(pregnancy.dueDate!)
            : null;

        final weekInfo = lmp != null
            ? PregnancyCalculator.calculateCurrentWeek(lmp)
            : (weeks: 0, days: 0);
        final progress = lmp != null
            ? PregnancyCalculator.calculateProgress(lmp) / 100
            : 0.0;
        final daysRemaining = dueDate != null
            ? PregnancyCalculator.getDaysRemaining(dueDate)
            : 0;
        final trimester = PregnancyCalculator.getTrimester(weekInfo.weeks);

        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Text(
                  'Hello, Mama!',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  DateFormat('EEEE, MMMM d').format(DateTime.now()),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textSecondary,
                  ),
                ),

                SizedBox(height: 24.h),

                // Progress Card
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: AppColors.primaryGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircularPercentIndicator(
                        radius: 55.w,
                        lineWidth: 10.w,
                        percent: progress.clamp(0.0, 1.0),
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${weekInfo.weeks}',
                              style: TextStyle(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'weeks',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                        progressColor: Colors.white,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              PregnancyCalculator.formatWeekDisplay(
                                weekInfo.weeks,
                                weekInfo.days,
                              ),
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Trimester $trimester',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white.withOpacity(0.9),
                              ),
                            ),
                            SizedBox(height: 12.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 6.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                '$daysRemaining days to go',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // Baby Size Comparison
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Icon(
                          Icons.child_care,
                          color: AppColors.primary,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Baby\'s Size',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            Text(
                              PregnancyCalculator.getBabySizeComparison(
                                  weekInfo.weeks),
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                // Quick Stats
                Text(
                  'Quick Stats',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(height: 12.h),

                StreamBuilder<List<Visit>>(
                  stream: _db.watchAllVisits(),
                  builder: (context, snapshot) {
                    final visits = snapshot.data ?? [];
                    final latestVisit = visits.isNotEmpty ? visits.first : null;

                    return Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.monitor_weight_outlined,
                            label: 'Weight',
                            value: latestVisit?.weightKg != null
                                ? '${latestVisit!.weightKg!.toStringAsFixed(1)} kg'
                                : '-- kg',
                            color: AppColors.chartWeight,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: _buildStatCard(
                            icon: Icons.favorite_outline,
                            label: 'Heartbeat',
                            value: latestVisit?.babyHeartbeatBpm != null
                                ? '${latestVisit!.babyHeartbeatBpm} bpm'
                                : '-- bpm',
                            color: AppColors.chartHeartbeat,
                          ),
                        ),
                      ],
                    );
                  },
                ),

                SizedBox(height: 24.h),

                // Recent Visits
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Visits',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    TextButton(
                      onPressed: () => setState(() => _selectedIndex = 1),
                      child: const Text('See All'),
                    ),
                  ],
                ),

                StreamBuilder<List<Visit>>(
                  stream: _db.watchAllVisits(),
                  builder: (context, snapshot) {
                    final visits = snapshot.data ?? [];

                    if (visits.isEmpty) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(32.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppColors.primaryLight,
                            style: BorderStyle.solid,
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.event_note_outlined,
                              size: 48.sp,
                              color: AppColors.textHint,
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              'No visits recorded yet',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Tap + to add your first visit',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.textHint,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return Column(
                      children: visits.take(3).map((visit) {
                        final visitDate = DateTime.fromMillisecondsSinceEpoch(
                            visit.visitDate);
                        return _buildVisitCard(visit, visitDate);
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(icon, color: color, size: 20.sp),
          ),
          SizedBox(height: 12.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 4.h),
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

  Widget _buildVisitCard(Visit visit, DateTime visitDate) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
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
                    fontSize: 18.sp,
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
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 4.h),
                Row(
                  children: [
                    if (visit.weightKg != null) ...[
                      Icon(Icons.monitor_weight, size: 14.sp, color: AppColors.textSecondary),
                      SizedBox(width: 4.w),
                      Text(
                        '${visit.weightKg!.toStringAsFixed(1)}kg',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(width: 12.w),
                    ],
                    if (visit.babyHeartbeatBpm != null) ...[
                      Icon(Icons.favorite, size: 14.sp, color: AppColors.textSecondary),
                      SizedBox(width: 4.w),
                      Text(
                        '${visit.babyHeartbeatBpm}bpm',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppColors.textHint,
          ),
        ],
      ),
    );
  }

  Widget _buildVisitsTab() {
    return const VisitListContent();
  }

  Widget _buildGalleryTab() {
    return const UltrasoundGalleryContent();
  }

  Widget _buildMedicationsTab() {
    return const MedicationListContent();
  }

  Widget _buildSettingsTab() {
    return const SettingsContent();
  }
}

// Inline content widgets for tabs
class VisitListContent extends StatelessWidget {
  const VisitListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Get.find<AppDatabase>();

    return Scaffold(
      appBar: AppBar(title: const Text('Visit History')),
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
                  SizedBox(height: 8.h),
                  Text(
                    'Tap + to add your first hospital visit',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textHint,
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
                  onTap: () {
                    // Navigate to visit detail
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class UltrasoundGalleryContent extends StatelessWidget {
  const UltrasoundGalleryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Get.find<AppDatabase>();

    return Scaffold(
      appBar: AppBar(title: const Text('Ultrasound Gallery')),
      body: StreamBuilder<List<UltrasoundImage>>(
        stream: db.watchAllUltrasounds(),
        builder: (context, snapshot) {
          final images = snapshot.data ?? [];

          if (images.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_library_outlined,
                    size: 64.sp,
                    color: AppColors.textHint,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No ultrasound images yet',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Add images when recording a visit',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textHint,
                    ),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: EdgeInsets.all(16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 48),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class MedicationListContent extends StatelessWidget {
  const MedicationListContent({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Get.find<AppDatabase>();

    return Scaffold(
      appBar: AppBar(title: const Text('Medications')),
      body: StreamBuilder<List<Medication>>(
        stream: db.watchActiveMedications(),
        builder: (context, snapshot) {
          final medications = snapshot.data ?? [];

          if (medications.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.medication_outlined,
                    size: 64.sp,
                    color: AppColors.textHint,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No medications recorded',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Add medications from a visit record',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textHint,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.all(16.w),
            itemCount: medications.length,
            itemBuilder: (context, index) {
              final medication = medications[index];
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
                    child: Icon(
                      Icons.medication,
                      color: AppColors.primary,
                      size: 24.sp,
                    ),
                  ),
                  title: Text(medication.name),
                  subtitle: Text(medication.dosage ?? 'No dosage specified'),
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

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text('Statistics'),
              subtitle: const Text('View weight, BP, and heartbeat trends'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Get.toNamed(AppRoutes.statistics),
            ),
          ),
          SizedBox(height: 12.h),
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Pregnancy Profile'),
              subtitle: const Text('View and edit your pregnancy details'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          SizedBox(height: 12.h),
          Card(
            child: ListTile(
              leading: const Icon(Icons.file_download),
              title: const Text('Export Data'),
              subtitle: const Text('Export your pregnancy data to JSON'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          SizedBox(height: 12.h),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              subtitle: const Text('BumpTracker v1.0.0'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
