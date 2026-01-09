# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

BumpTracker is a Flutter pregnancy tracking application for monitoring hospital visits, measurements, ultrasounds, medications, and health data during pregnancy. It uses local SQLite storage with no cloud sync.

## Common Commands

```bash
# Dependencies
flutter pub get

# Run app
flutter run

# Build
flutter build apk          # Android
flutter build ios          # iOS
flutter build web          # Web

# Code generation (required after modifying database schema)
flutter pub run build_runner build --delete-conflicting-outputs

# Testing & Analysis
flutter test               # Run all tests
flutter test test/widget_test.dart  # Run single test
flutter analyze            # Lint analysis
```

## Architecture

### Feature-Based Structure

The app follows a feature-based modular architecture with Clean Architecture layers:

```
lib/
├── main.dart              # Entry point, database initialization
├── app.dart               # Root widget with GetMaterialApp
├── routes/                # GetX routing (app_routes.dart, app_pages.dart)
├── core/                  # Shared code
│   ├── database/          # Drift ORM (database.dart defines all 6 tables)
│   ├── theme/             # Material3 themes and colors
│   ├── constants/         # Enums (MedicationFrequency, LabResultType)
│   └── helpers/           # PregnancyCalculator, ExportHelper
├── feature/               # Feature modules (see below)
└── widgets/               # Shared UI components
```

### Feature Modules

Each feature in `lib/feature/` follows this structure:
- `presentation/page/` - UI screens
- `presentation/controller/` - GetX controllers (partially implemented)
- `domain/` - Entities, repositories, use cases
- `data/` - Models, repository implementations

**Key features:** splash, onboarding, home, visit, medication, ultrasound, statistics, settings, appointment, lab_result, pregnancy_profile

### State Management

- **GetX** for routing (`Get.toNamed()`) and dependency injection (`Get.put()`, `Get.find()`)
- Database access via `Get.find<AppDatabase>()`
- Most screens use StatefulWidget with StreamBuilder for reactive database updates
- Controllers exist structurally but are not yet fully implemented

### Database (Drift ORM)

Six tables defined in `lib/core/database/database.dart`:
- **Pregnancies** - Core pregnancy record with dates, doctor/hospital info
- **Visits** - Hospital visits with health metrics (weight, BP, heartbeat)
- **Medications** - Active/inactive medications with dosage and frequency
- **LabResults** - Lab test results with optional image paths (JSON array)
- **UltrasoundImages** - Ultrasound photos with measurements (JSON)
- **Appointments** - Scheduled appointments with reminder settings

After modifying tables, regenerate with: `flutter pub run build_runner build --delete-conflicting-outputs`

### Key Dependencies

| Package | Purpose |
|---------|---------|
| get | Routing, service locator |
| drift + sqlite3_flutter_libs | Local SQLite database |
| flutter_screenutil | Responsive sizing (375x812 base) |
| fl_chart | Statistics charts |
| image_picker + flutter_image_compress | Ultrasound image handling |
| flutter_local_notifications | Appointment reminders |
| shared_preferences | Onboarding state, active pregnancy ID |

### UI System

- **flutter_screenutil** with 375x812 design base (use `.w`, `.h`, `.sp` extensions)
- Material Design 3 with pink/coral theme defined in `lib/core/theme/`
- Light theme only (dark theme defined but not enabled)

### Helper Utilities

- **PregnancyCalculator** (`lib/core/helpers/pregnancy_calculator.dart`) - Week/trimester calculations, baby size comparisons
- **ExportHelper** (`lib/core/helpers/export_helper.dart`) - JSON data export with share_plus
