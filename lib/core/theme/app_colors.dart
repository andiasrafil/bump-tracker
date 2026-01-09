import 'package:flutter/material.dart';

class AppColors {
  // Primary colors - Warm coral/peach (softer, more playful)
  static const Color primary = Color(0xFFFF8A80);
  static const Color primaryLight = Color(0xFFFFCCBC);
  static const Color primaryDark = Color(0xFFE57373);

  // Secondary colors - Soft lavender
  static const Color secondary = Color(0xFFB39DDB);
  static const Color secondaryLight = Color(0xFFE1BEE7);
  static const Color secondaryDark = Color(0xFF9575CD);

  // Accent colors for variety and fun
  static const Color accent1 = Color(0xFF80DEEA); // Soft teal
  static const Color accent2 = Color(0xFFFFF59D); // Soft yellow
  static const Color accent3 = Color(0xFFA5D6A7); // Soft green
  static const Color accent4 = Color(0xFFFFCC80); // Soft orange

  // Background colors - Warm cream instead of cold gray
  static const Color background = Color(0xFFFFFBF5);
  static const Color surface = Color(0xFFFFFDF9);
  static const Color cardBackground = Colors.white;
  static const Color inputBackground = Color(0xFFFFF8F0);

  // Text colors - Softer than pure black
  static const Color textPrimary = Color(0xFF4A4A4A);
  static const Color textSecondary = Color(0xFF888888);
  static const Color textHint = Color(0xFFBDBDBD);

  // Status colors - Softer versions
  static const Color success = Color(0xFF66BB6A);
  static const Color warning = Color(0xFFFFB74D);
  static const Color error = Color(0xFFEF5350);
  static const Color info = Color(0xFF42A5F5);

  // Chart colors - More vibrant and fun
  static const Color chartWeight = Color(0xFFB39DDB);
  static const Color chartBloodPressureSystolic = Color(0xFFFF8A80);
  static const Color chartBloodPressureDiastolic = Color(0xFFFFB74D);
  static const Color chartHeartbeat = Color(0xFF81C784);

  // Trimester colors - Soft pastels
  static const Color trimester1 = Color(0xFFFFE0B2); // Soft peach
  static const Color trimester2 = Color(0xFFFFCCBC); // Warm coral
  static const Color trimester3 = Color(0xFFE1BEE7); // Soft lavender

  // Mood colors for sticker feature
  static const Color moodHappy = Color(0xFFFFF59D);     // Yellow
  static const Color moodTired = Color(0xFFB0BEC5);     // Gray-blue
  static const Color moodNauseous = Color(0xFFA5D6A7);  // Green
  static const Color moodAnxious = Color(0xFFCE93D8);   // Purple
  static const Color moodStrong = Color(0xFFFF8A80);    // Coral
  static const Color moodEmotional = Color(0xFF90CAF9); // Blue
  static const Color moodCalm = Color(0xFF80DEEA);      // Teal
  static const Color moodExcited = Color(0xFFFFCC80);   // Orange

  // Get mood color by index
  static Color getMoodColor(int moodIndex) {
    switch (moodIndex) {
      case 0:
        return moodHappy;
      case 1:
        return moodTired;
      case 2:
        return moodNauseous;
      case 3:
        return moodAnxious;
      case 4:
        return moodStrong;
      case 5:
        return moodEmotional;
      case 6:
        return moodCalm;
      case 7:
        return moodExcited;
      default:
        return moodHappy;
    }
  }

  // Card gradients - Playful combinations
  static const List<Color> primaryGradient = [
    Color(0xFFFF8A80),
    Color(0xFFFFAB91),
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFFB39DDB),
    Color(0xFFCE93D8),
  ];

  static const List<Color> celebrationGradient = [
    Color(0xFFFFD54F),
    Color(0xFFFFB74D),
    Color(0xFFFF8A65),
  ];

  static const List<Color> calmGradient = [
    Color(0xFF80DEEA),
    Color(0xFF80CBC4),
  ];

  // Week progress gradient
  static const List<Color> progressGradient = [
    Color(0xFFFFAB91),
    Color(0xFFFF8A80),
    Color(0xFFCE93D8),
  ];
}
