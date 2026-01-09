import 'package:get/get.dart';
import 'app_routes.dart';
import '../feature/splash/presentation/page/splash_screen.dart';
import '../feature/onboarding/presentation/page/onboarding_screen.dart';
import '../feature/home/presentation/page/home_screen.dart';
import '../feature/visit/presentation/page/visit_list_screen.dart';
import '../feature/visit/presentation/page/add_visit_screen.dart';
import '../feature/medication/presentation/page/medication_list_screen.dart';
import '../feature/ultrasound/presentation/page/ultrasound_gallery_screen.dart';
import '../feature/settings/presentation/page/settings_screen.dart';
import '../feature/statistics/presentation/page/statistics_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.visitList,
      page: () => const VisitListScreen(),
    ),
    GetPage(
      name: AppRoutes.addVisit,
      page: () => const AddVisitScreen(),
    ),
    GetPage(
      name: AppRoutes.medications,
      page: () => const MedicationListScreen(),
    ),
    GetPage(
      name: AppRoutes.ultrasoundGallery,
      page: () => const UltrasoundGalleryScreen(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: AppRoutes.statistics,
      page: () => const StatisticsScreen(),
    ),
  ];
}
