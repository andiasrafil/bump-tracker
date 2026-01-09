class PregnancyCalculator {
  /// Standard pregnancy is 40 weeks (280 days) from LMP
  static const int standardPregnancyDays = 280;
  static const int standardPregnancyWeeks = 40;

  /// Calculate due date from Last Menstrual Period (Naegele's rule)
  static DateTime calculateDueDate(DateTime lmp) {
    return lmp.add(const Duration(days: standardPregnancyDays));
  }

  /// Calculate due date from conception date
  static DateTime calculateDueDateFromConception(DateTime conceptionDate) {
    // Add 266 days (38 weeks) from conception
    return conceptionDate.add(const Duration(days: 266));
  }

  /// Calculate current pregnancy week and day
  static ({int weeks, int days}) calculateCurrentWeek(DateTime lmp) {
    final daysSinceLMP = DateTime.now().difference(lmp).inDays;
    if (daysSinceLMP < 0) return (weeks: 0, days: 0);

    final weeks = daysSinceLMP ~/ 7;
    final days = daysSinceLMP % 7;
    return (weeks: weeks, days: days);
  }

  /// Calculate pregnancy week at a specific date
  static ({int weeks, int days}) calculateWeekAtDate(DateTime lmp, DateTime date) {
    final daysSinceLMP = date.difference(lmp).inDays;
    if (daysSinceLMP < 0) return (weeks: 0, days: 0);

    final weeks = daysSinceLMP ~/ 7;
    final days = daysSinceLMP % 7;
    return (weeks: weeks, days: days);
  }

  /// Calculate pregnancy progress percentage
  static double calculateProgress(DateTime lmp) {
    final daysSinceLMP = DateTime.now().difference(lmp).inDays;
    if (daysSinceLMP < 0) return 0;
    if (daysSinceLMP > standardPregnancyDays) return 100;
    return (daysSinceLMP / standardPregnancyDays) * 100;
  }

  /// Get current trimester (1, 2, or 3)
  static int getTrimester(int currentWeek) {
    if (currentWeek <= 12) return 1;
    if (currentWeek <= 27) return 2;
    return 3;
  }

  /// Get trimester description
  static String getTrimesterDescription(int trimester) {
    switch (trimester) {
      case 1:
        return 'First Trimester (Weeks 1-12)';
      case 2:
        return 'Second Trimester (Weeks 13-27)';
      case 3:
        return 'Third Trimester (Weeks 28-40)';
      default:
        return 'Unknown';
    }
  }

  /// Get days remaining until due date
  static int getDaysRemaining(DateTime dueDate) {
    final remaining = dueDate.difference(DateTime.now()).inDays;
    return remaining > 0 ? remaining : 0;
  }

  /// Check if pregnancy is overdue
  static bool isOverdue(DateTime dueDate) {
    return DateTime.now().isAfter(dueDate);
  }

  /// Format pregnancy week display (e.g., "Week 24, Day 3")
  static String formatWeekDisplay(int weeks, int days) {
    return 'Week $weeks, Day $days';
  }

  /// Get baby size comparison for the current week
  static String getBabySizeComparison(int week) {
    final comparisons = {
      4: 'Poppy seed',
      5: 'Sesame seed',
      6: 'Lentil',
      7: 'Blueberry',
      8: 'Kidney bean',
      9: 'Grape',
      10: 'Kumquat',
      11: 'Fig',
      12: 'Lime',
      13: 'Peapod',
      14: 'Lemon',
      15: 'Apple',
      16: 'Avocado',
      17: 'Turnip',
      18: 'Bell pepper',
      19: 'Tomato',
      20: 'Banana',
      21: 'Carrot',
      22: 'Spaghetti squash',
      23: 'Mango',
      24: 'Corn ear',
      25: 'Rutabaga',
      26: 'Scallion',
      27: 'Cauliflower',
      28: 'Eggplant',
      29: 'Butternut squash',
      30: 'Large cabbage',
      31: 'Coconut',
      32: 'Jicama',
      33: 'Pineapple',
      34: 'Cantaloupe',
      35: 'Honeydew melon',
      36: 'Romaine lettuce',
      37: 'Swiss chard',
      38: 'Leek',
      39: 'Mini watermelon',
      40: 'Small pumpkin',
    };
    return comparisons[week] ?? 'Growing baby';
  }
}
