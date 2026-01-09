class AppConstants {
  // App Info
  static const String appName = 'BumpTracker';
  static const String appVersion = '1.0.0';

  // Normal ranges for monitoring
  static const double minNormalWeightGain = 11.5; // kg
  static const double maxNormalWeightGain = 16.0; // kg

  static const int normalSystolicMin = 90;
  static const int normalSystolicMax = 120;
  static const int normalDiastolicMin = 60;
  static const int normalDiastolicMax = 80;

  static const int normalHeartbeatMin = 110; // bpm
  static const int normalHeartbeatMax = 160; // bpm

  // Trimester weeks
  static const int firstTrimesterEnd = 12;
  static const int secondTrimesterEnd = 27;
  static const int fullTermWeek = 40;

  // Appointment reminder options (minutes)
  static const List<int> reminderOptions = [
    15, // 15 minutes
    30, // 30 minutes
    60, // 1 hour
    120, // 2 hours
    1440, // 1 day
    2880, // 2 days
  ];

  // SharedPreferences Keys
  static const String prefOnboardingComplete = 'onboarding_complete';
  static const String prefActivePregnancyId = 'active_pregnancy_id';
}

enum MedicationFrequency {
  onceDaily,
  twiceDaily,
  thriceDaily,
  asNeeded,
  weekly,
  custom,
}

extension MedicationFrequencyExtension on MedicationFrequency {
  String get displayName {
    switch (this) {
      case MedicationFrequency.onceDaily:
        return 'Once daily';
      case MedicationFrequency.twiceDaily:
        return 'Twice daily';
      case MedicationFrequency.thriceDaily:
        return '3 times daily';
      case MedicationFrequency.asNeeded:
        return 'As needed';
      case MedicationFrequency.weekly:
        return 'Weekly';
      case MedicationFrequency.custom:
        return 'Custom';
    }
  }
}

enum LabResultType {
  bloodTest,
  urineTest,
  glucoseTest,
  ultrasoundReport,
  other,
}

extension LabResultTypeExtension on LabResultType {
  String get displayName {
    switch (this) {
      case LabResultType.bloodTest:
        return 'Blood Test';
      case LabResultType.urineTest:
        return 'Urine Test';
      case LabResultType.glucoseTest:
        return 'Glucose Test';
      case LabResultType.ultrasoundReport:
        return 'Ultrasound Report';
      case LabResultType.other:
        return 'Other';
    }
  }
}
