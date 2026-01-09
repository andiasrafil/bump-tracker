import '../constants/app_constants.dart';

class MilestoneHelper {
  // Key milestone weeks during pregnancy
  static const List<int> milestoneWeeks = [
    4,   // Positive test typically
    8,   // First heartbeat often detected
    12,  // End of first trimester
    16,  // Baby starts moving
    20,  // Halfway point, anatomy scan
    24,  // Viability milestone
    28,  // Third trimester begins
    32,  // Baby practicing breathing
    36,  // Full term approaching
    37,  // Early term
    40,  // Due date
  ];

  // Check if current week is a milestone
  static bool isMilestoneWeek(int week) {
    return milestoneWeeks.contains(week);
  }

  // Check if user just entered a milestone week
  static bool shouldCelebrate(int previousWeek, int currentWeek) {
    for (final milestone in milestoneWeeks) {
      if (previousWeek < milestone && currentWeek >= milestone) {
        return true;
      }
    }
    return false;
  }

  // Get milestone info for a specific week
  static MilestoneInfo? getMilestoneInfo(int week) {
    switch (week) {
      case 4:
        return MilestoneInfo(
          week: 4,
          title: 'The Journey Begins!',
          message: 'Your little one is just starting to form. Exciting times ahead!',
          emoji: '🌱',
          babySize: 'a poppy seed',
        );
      case 8:
        return MilestoneInfo(
          week: 8,
          title: 'Heartbeat Milestone!',
          message: 'Your baby\'s heart is now beating! What an amazing moment.',
          emoji: '💓',
          babySize: 'a raspberry',
        );
      case 12:
        return MilestoneInfo(
          week: 12,
          title: 'First Trimester Complete!',
          message: 'Congratulations! You\'ve completed the first trimester. The risk of complications drops significantly now.',
          emoji: '🎉',
          babySize: 'a lime',
        );
      case 16:
        return MilestoneInfo(
          week: 16,
          title: 'Feeling the Flutters?',
          message: 'Around this time, you might start feeling those first magical movements!',
          emoji: '🦋',
          babySize: 'an avocado',
        );
      case 20:
        return MilestoneInfo(
          week: 20,
          title: 'Halfway There!',
          message: 'You\'re at the halfway point! Your baby is growing stronger every day.',
          emoji: '🌟',
          babySize: 'a banana',
        );
      case 24:
        return MilestoneInfo(
          week: 24,
          title: 'Viability Milestone!',
          message: 'This is a significant milestone! Your baby has reached viability.',
          emoji: '💪',
          babySize: 'an ear of corn',
        );
      case 28:
        return MilestoneInfo(
          week: 28,
          title: 'Third Trimester!',
          message: 'Welcome to the third trimester! The final stretch has begun.',
          emoji: '🏃‍♀️',
          babySize: 'an eggplant',
        );
      case 32:
        return MilestoneInfo(
          week: 32,
          title: 'Almost There!',
          message: 'Your baby is practicing breathing and getting ready for the world!',
          emoji: '🫁',
          babySize: 'a squash',
        );
      case 36:
        return MilestoneInfo(
          week: 36,
          title: 'Full Term Approaching!',
          message: 'Your baby is almost ready! Most organs are fully developed now.',
          emoji: '👶',
          babySize: 'a honeydew melon',
        );
      case 37:
        return MilestoneInfo(
          week: 37,
          title: 'Early Term!',
          message: 'Your baby is now considered early term! They could arrive any day.',
          emoji: '🎁',
          babySize: 'a winter melon',
        );
      case 40:
        return MilestoneInfo(
          week: 40,
          title: 'Due Date Week!',
          message: 'This is it! Your due date week has arrived. Good luck, Mama!',
          emoji: '🎊',
          babySize: 'a small pumpkin',
        );
      default:
        return null;
    }
  }

  // Get trimester celebration info
  static MilestoneInfo? getTrimesterInfo(int week) {
    if (week == AppConstants.firstTrimesterEnd) {
      return getMilestoneInfo(12);
    } else if (week == AppConstants.secondTrimesterEnd + 1) {
      return getMilestoneInfo(28);
    }
    return null;
  }

  // Get encouraging message for any week
  static String getWeeklyEncouragement(int week) {
    if (week <= 12) {
      return 'First trimester - take it easy and rest when needed!';
    } else if (week <= 27) {
      return 'Second trimester - often called the "golden period"!';
    } else if (week <= 36) {
      return 'Third trimester - you\'re in the home stretch!';
    } else {
      return 'Any day now! You\'ve got this, Mama!';
    }
  }

  // Get next milestone
  static int? getNextMilestone(int currentWeek) {
    for (final milestone in milestoneWeeks) {
      if (milestone > currentWeek) {
        return milestone;
      }
    }
    return null;
  }

  // Get weeks until next milestone
  static int? weeksUntilNextMilestone(int currentWeek) {
    final nextMilestone = getNextMilestone(currentWeek);
    if (nextMilestone != null) {
      return nextMilestone - currentWeek;
    }
    return null;
  }
}

class MilestoneInfo {
  final int week;
  final String title;
  final String message;
  final String emoji;
  final String babySize;

  const MilestoneInfo({
    required this.week,
    required this.title,
    required this.message,
    required this.emoji,
    required this.babySize,
  });
}
