import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/database/database.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _db = Get.find<AppDatabase>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Weight'),
            Tab(text: 'Blood Pressure'),
            Tab(text: 'Heartbeat'),
          ],
        ),
      ),
      body: StreamBuilder<List<Visit>>(
        stream: _db.watchAllVisits(),
        builder: (context, snapshot) {
          final visits = snapshot.data ?? [];

          if (visits.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bar_chart,
                    size: 64.sp,
                    color: AppColors.textHint,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No data to display',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Record visits to see your statistics',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textHint,
                    ),
                  ),
                ],
              ),
            );
          }

          // Sort visits by date (oldest first for charts)
          final sortedVisits = List<Visit>.from(visits)
            ..sort((a, b) => a.visitDate.compareTo(b.visitDate));

          return TabBarView(
            controller: _tabController,
            children: [
              _WeightChart(visits: sortedVisits),
              _BloodPressureChart(visits: sortedVisits),
              _HeartbeatChart(visits: sortedVisits),
            ],
          );
        },
      ),
    );
  }
}

class _WeightChart extends StatelessWidget {
  final List<Visit> visits;

  const _WeightChart({required this.visits});

  @override
  Widget build(BuildContext context) {
    final dataPoints = visits
        .where((v) => v.weightKg != null)
        .map((v) => _DataPoint(
              date: DateTime.fromMillisecondsSinceEpoch(v.visitDate),
              value: v.weightKg!,
              week: v.pregnancyWeekAtVisit,
            ))
        .toList();

    if (dataPoints.isEmpty) {
      return _EmptyChartMessage(message: 'No weight data recorded');
    }

    final minWeight = dataPoints.map((e) => e.value).reduce((a, b) => a < b ? a : b);
    final maxWeight = dataPoints.map((e) => e.value).reduce((a, b) => a > b ? a : b);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatSummaryCard(
            title: 'Weight Summary',
            icon: Icons.monitor_weight,
            color: AppColors.chartWeight,
            stats: [
              _StatItem('Current', '${dataPoints.last.value.toStringAsFixed(1)} kg'),
              _StatItem('Min', '${minWeight.toStringAsFixed(1)} kg'),
              _StatItem('Max', '${maxWeight.toStringAsFixed(1)} kg'),
              _StatItem('Change', '${(dataPoints.last.value - dataPoints.first.value).toStringAsFixed(1)} kg'),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'Weight Trend',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 250.h,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 5,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade200,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.textSecondary,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < dataPoints.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              dataPoints[index].week != null
                                  ? 'W${dataPoints[index].week}'
                                  : DateFormat('M/d').format(dataPoints[index].date),
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                minY: minWeight - 2,
                maxY: maxWeight + 2,
                lineBarsData: [
                  LineChartBarData(
                    spots: dataPoints
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value.value))
                        .toList(),
                    isCurved: true,
                    color: AppColors.chartWeight,
                    barWidth: 3,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: AppColors.chartWeight,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.chartWeight.withValues(alpha: 0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BloodPressureChart extends StatelessWidget {
  final List<Visit> visits;

  const _BloodPressureChart({required this.visits});

  @override
  Widget build(BuildContext context) {
    final dataPoints = visits
        .where((v) => v.bloodPressureSystolic != null && v.bloodPressureDiastolic != null)
        .map((v) => _BPDataPoint(
              date: DateTime.fromMillisecondsSinceEpoch(v.visitDate),
              systolic: v.bloodPressureSystolic!.toDouble(),
              diastolic: v.bloodPressureDiastolic!.toDouble(),
              week: v.pregnancyWeekAtVisit,
            ))
        .toList();

    if (dataPoints.isEmpty) {
      return _EmptyChartMessage(message: 'No blood pressure data recorded');
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatSummaryCard(
            title: 'Blood Pressure Summary',
            icon: Icons.favorite,
            color: AppColors.chartBloodPressureSystolic,
            stats: [
              _StatItem('Latest', '${dataPoints.last.systolic.toInt()}/${dataPoints.last.diastolic.toInt()} mmHg'),
              _StatItem('Avg Systolic', '${(dataPoints.map((e) => e.systolic).reduce((a, b) => a + b) / dataPoints.length).toInt()} mmHg'),
              _StatItem('Avg Diastolic', '${(dataPoints.map((e) => e.diastolic).reduce((a, b) => a + b) / dataPoints.length).toInt()} mmHg'),
            ],
          ),
          SizedBox(height: 24.h),
          Text(
            'Blood Pressure Trend',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 250.h,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade200,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.textSecondary,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < dataPoints.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              dataPoints[index].week != null
                                  ? 'W${dataPoints[index].week}'
                                  : DateFormat('M/d').format(dataPoints[index].date),
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                minY: 40,
                maxY: 180,
                lineBarsData: [
                  // Systolic line
                  LineChartBarData(
                    spots: dataPoints
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value.systolic))
                        .toList(),
                    isCurved: true,
                    color: AppColors.chartBloodPressureSystolic,
                    barWidth: 3,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: AppColors.chartBloodPressureSystolic,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                  ),
                  // Diastolic line
                  LineChartBarData(
                    spots: dataPoints
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value.diastolic))
                        .toList(),
                    isCurved: true,
                    color: AppColors.chartBloodPressureDiastolic,
                    barWidth: 3,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: AppColors.chartBloodPressureDiastolic,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _LegendItem(color: AppColors.chartBloodPressureSystolic, label: 'Systolic'),
              SizedBox(width: 24.w),
              _LegendItem(color: AppColors.chartBloodPressureDiastolic, label: 'Diastolic'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeartbeatChart extends StatelessWidget {
  final List<Visit> visits;

  const _HeartbeatChart({required this.visits});

  @override
  Widget build(BuildContext context) {
    final dataPoints = visits
        .where((v) => v.babyHeartbeatBpm != null)
        .map((v) => _DataPoint(
              date: DateTime.fromMillisecondsSinceEpoch(v.visitDate),
              value: v.babyHeartbeatBpm!.toDouble(),
              week: v.pregnancyWeekAtVisit,
            ))
        .toList();

    if (dataPoints.isEmpty) {
      return _EmptyChartMessage(message: 'No heartbeat data recorded');
    }

    final minHeart = dataPoints.map((e) => e.value).reduce((a, b) => a < b ? a : b);
    final maxHeart = dataPoints.map((e) => e.value).reduce((a, b) => a > b ? a : b);
    final avgHeart = dataPoints.map((e) => e.value).reduce((a, b) => a + b) / dataPoints.length;

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _StatSummaryCard(
            title: 'Baby Heartbeat Summary',
            icon: Icons.favorite_border,
            color: AppColors.chartHeartbeat,
            stats: [
              _StatItem('Latest', '${dataPoints.last.value.toInt()} bpm'),
              _StatItem('Average', '${avgHeart.toInt()} bpm'),
              _StatItem('Min', '${minHeart.toInt()} bpm'),
              _StatItem('Max', '${maxHeart.toInt()} bpm'),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.info.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: AppColors.info, size: 20.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'Normal fetal heart rate: 110-160 bpm',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.info,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Text(
            'Heartbeat Trend',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            height: 250.h,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade200,
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '${value.toInt()}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: AppColors.textSecondary,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        final index = value.toInt();
                        if (index >= 0 && index < dataPoints.length) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              dataPoints[index].week != null
                                  ? 'W${dataPoints[index].week}'
                                  : DateFormat('M/d').format(dataPoints[index].date),
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                minY: 80,
                maxY: 200,
                lineBarsData: [
                  LineChartBarData(
                    spots: dataPoints
                        .asMap()
                        .entries
                        .map((e) => FlSpot(e.key.toDouble(), e.value.value))
                        .toList(),
                    isCurved: true,
                    color: AppColors.chartHeartbeat,
                    barWidth: 3,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: AppColors.chartHeartbeat,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: AppColors.chartHeartbeat.withValues(alpha: 0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DataPoint {
  final DateTime date;
  final double value;
  final int? week;

  _DataPoint({required this.date, required this.value, this.week});
}

class _BPDataPoint {
  final DateTime date;
  final double systolic;
  final double diastolic;
  final int? week;

  _BPDataPoint({
    required this.date,
    required this.systolic,
    required this.diastolic,
    this.week,
  });
}

class _EmptyChartMessage extends StatelessWidget {
  final String message;

  const _EmptyChartMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.show_chart,
            size: 64.sp,
            color: AppColors.textHint,
          ),
          SizedBox(height: 16.h),
          Text(
            message,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatSummaryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<_StatItem> stats;

  const _StatSummaryCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
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
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, color: color, size: 20.sp),
              ),
              SizedBox(width: 12.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Wrap(
            spacing: 16.w,
            runSpacing: 12.h,
            children: stats.map((stat) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 80) / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stat.label,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      stat.value,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _StatItem {
  final String label;
  final String value;

  _StatItem(this.label, this.value);
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
