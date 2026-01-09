# BumpTracker

A Flutter pregnancy tracking application for monitoring hospital visits, health measurements, ultrasounds, medications, and appointments throughout pregnancy.

## Features

- **Pregnancy Dashboard** - Track pregnancy progress with week/day counter, trimester info, and baby size comparisons
- **Visit Management** - Log hospital visits with weight, blood pressure, and baby heartbeat measurements
- **Medication Tracking** - Manage active medications with dosage and frequency
- **Ultrasound Gallery** - Store and view ultrasound images with measurements
- **Statistics & Charts** - Visualize weight trends, blood pressure, and heartbeat data over time
- **Lab Results** - Track lab test results with optional image attachments
- **Appointments** - Schedule appointments with local notification reminders
- **Data Export** - Export all data to JSON format

## Getting Started

### Prerequisites

- Flutter SDK 3.38.3 or later
- Dart 3.10.1 or later

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/bump_tracker.git
cd bump_tracker

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Build

```bash
flutter build apk    # Android
flutter build ios    # iOS
flutter build web    # Web
```

## Tech Stack

- **Framework**: Flutter with Dart
- **State Management**: GetX (routing, dependency injection)
- **Database**: Drift (SQLite ORM) with local storage
- **UI**: Material Design 3 with flutter_screenutil for responsive layouts
- **Charts**: fl_chart for statistics visualization
- **Notifications**: flutter_local_notifications for appointment reminders

## Project Structure

```
lib/
├── main.dart          # App entry point
├── app.dart           # Root widget configuration
├── routes/            # GetX routing
├── core/              # Shared code (database, theme, helpers)
├── feature/           # Feature modules (home, visit, medication, etc.)
└── widgets/           # Reusable UI components
```

## License

This project is private and not licensed for public use.
