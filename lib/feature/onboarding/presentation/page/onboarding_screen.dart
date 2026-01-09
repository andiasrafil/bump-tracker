import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart' as drift;
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/database/database.dart';
import '../../../../core/helpers/pregnancy_calculator.dart';
import '../../../../routes/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();

  DateTime? _lastMenstrualPeriod;
  DateTime? _dueDate;
  final _doctorNameController = TextEditingController();
  final _hospitalNameController = TextEditingController();

  int _currentPage = 0;
  bool _isLoading = false;

  @override
  void dispose() {
    _pageController.dispose();
    _doctorNameController.dispose();
    _hospitalNameController.dispose();
    super.dispose();
  }

  Future<void> _selectLMP() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 60)),
      firstDate: DateTime.now().subtract(const Duration(days: 280)),
      lastDate: DateTime.now(),
      helpText: 'Select Last Menstrual Period Date',
    );

    if (date != null) {
      setState(() {
        _lastMenstrualPeriod = date;
        _dueDate = PregnancyCalculator.calculateDueDate(date);
      });
    }
  }

  Future<void> _selectDueDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? DateTime.now().add(const Duration(days: 180)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 300)),
      helpText: 'Select Expected Due Date',
    );

    if (date != null) {
      setState(() {
        _dueDate = date;
        // Calculate LMP from due date (subtract 280 days)
        _lastMenstrualPeriod = date.subtract(const Duration(days: 280));
      });
    }
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> _completeOnboarding() async {
    if (_lastMenstrualPeriod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select your last menstrual period date'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final db = Get.find<AppDatabase>();
      final uuid = const Uuid();
      final now = DateTime.now().millisecondsSinceEpoch;

      final pregnancyId = uuid.v4();

      await db.insertPregnancy(PregnanciesCompanion(
        id: drift.Value(pregnancyId),
        lastMenstrualPeriod: drift.Value(_lastMenstrualPeriod!.millisecondsSinceEpoch),
        dueDate: drift.Value(_dueDate?.millisecondsSinceEpoch),
        doctorName: drift.Value(_doctorNameController.text.isNotEmpty
            ? _doctorNameController.text
            : null),
        hospitalName: drift.Value(_hospitalNameController.text.isNotEmpty
            ? _hospitalNameController.text
            : null),
        createdAt: drift.Value(now),
        updatedAt: drift.Value(now),
      ));

      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(AppConstants.prefOnboardingComplete, true);
      await prefs.setString(AppConstants.prefActivePregnancyId, pregnancyId);

      Get.offAllNamed(AppRoutes.home);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving data: $e'),
          backgroundColor: AppColors.error,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Progress indicator
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Container(
                      height: 4.h,
                      margin: EdgeInsets.symmetric(horizontal: 2.w),
                      decoration: BoxDecoration(
                        color: index <= _currentPage
                            ? AppColors.primary
                            : AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Page content
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  setState(() => _currentPage = page);
                },
                children: [
                  _buildWelcomePage(),
                  _buildDateSelectionPage(),
                  _buildDoctorInfoPage(),
                ],
              ),
            ),

            // Navigation buttons
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  if (_currentPage > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _previousPage,
                        child: const Text('Back'),
                      ),
                    ),
                  if (_currentPage > 0) SizedBox(width: 16.w),
                  Expanded(
                    flex: _currentPage > 0 ? 1 : 2,
                    child: ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : _currentPage < 2
                              ? _nextPage
                              : _completeOnboarding,
                      child: _isLoading
                          ? SizedBox(
                              width: 20.w,
                              height: 20.w,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(_currentPage < 2 ? 'Next' : 'Get Started'),
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

  Widget _buildWelcomePage() {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120.w,
            height: 120.w,
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Icon(
              Icons.pregnant_woman,
              size: 60.sp,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 32.h),
          Text(
            'Welcome to BumpTracker',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          Text(
            'Track your pregnancy journey with ease. Log your hospital visits, monitor your health metrics, and keep all your pregnancy records in one place.',
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelectionPage() {
    final weekInfo = _lastMenstrualPeriod != null
        ? PregnancyCalculator.calculateCurrentWeek(_lastMenstrualPeriod!)
        : null;

    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'When did your pregnancy start?',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'This helps us calculate your due date and track your progress.',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 32.h),

          // LMP Selection
          Text(
            'Last Menstrual Period (LMP)',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          InkWell(
            onTap: _selectLMP,
            borderRadius: BorderRadius.circular(12.r),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(12.r),
                border: _lastMenstrualPeriod != null
                    ? Border.all(color: AppColors.primary, width: 2)
                    : null,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: AppColors.primary,
                    size: 20.sp,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    _lastMenstrualPeriod != null
                        ? '${_lastMenstrualPeriod!.day}/${_lastMenstrualPeriod!.month}/${_lastMenstrualPeriod!.year}'
                        : 'Select date',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: _lastMenstrualPeriod != null
                          ? AppColors.textPrimary
                          : AppColors.textHint,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Due Date
          Text(
            'Expected Due Date',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          InkWell(
            onTap: _selectDueDate,
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
                  Icon(
                    Icons.child_care,
                    color: AppColors.primary,
                    size: 20.sp,
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    _dueDate != null
                        ? '${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}'
                        : 'Auto-calculated or select manually',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: _dueDate != null
                          ? AppColors.textPrimary
                          : AppColors.textHint,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Show current week if LMP is selected
          if (weekInfo != null) ...[
            SizedBox(height: 32.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                children: [
                  Text(
                    'You are currently at',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    PregnancyCalculator.formatWeekDisplay(
                      weekInfo.weeks,
                      weekInfo.days,
                    ),
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Baby is about the size of a ${PregnancyCalculator.getBabySizeComparison(weekInfo.weeks)}',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDoctorInfoPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Doctor & Hospital Info',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Optional: Add your healthcare provider details for easy reference.',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 32.h),

          // Doctor Name
          Text(
            'Doctor\'s Name',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: _doctorNameController,
            decoration: const InputDecoration(
              hintText: 'Enter doctor\'s name',
              prefixIcon: Icon(Icons.person),
            ),
          ),

          SizedBox(height: 24.h),

          // Hospital Name
          Text(
            'Hospital / Clinic Name',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 8.h),
          TextField(
            controller: _hospitalNameController,
            decoration: const InputDecoration(
              hintText: 'Enter hospital or clinic name',
              prefixIcon: Icon(Icons.local_hospital),
            ),
          ),

          SizedBox(height: 32.h),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.info.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  color: AppColors.info,
                  size: 20.sp,
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    'You can always update this information later in settings.',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.info,
                    ),
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
