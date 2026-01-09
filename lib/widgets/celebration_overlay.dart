import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/theme/app_colors.dart';
import '../core/helpers/milestone_helper.dart';

class CelebrationOverlay extends StatefulWidget {
  final MilestoneInfo milestone;
  final VoidCallback onDismiss;

  const CelebrationOverlay({
    super.key,
    required this.milestone,
    required this.onDismiss,
  });

  @override
  State<CelebrationOverlay> createState() => _CelebrationOverlayState();
}

class _CelebrationOverlayState extends State<CelebrationOverlay>
    with TickerProviderStateMixin {
  late AnimationController _confettiController;
  late AnimationController _contentController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  final List<_ConfettiParticle> _particles = [];
  final Random _random = Random();

  @override
  void initState() {
    super.initState();

    // Confetti animation
    _confettiController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Content animation
    _contentController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _contentController, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _contentController, curve: Curves.easeIn),
    );

    // Generate confetti particles
    _generateParticles();

    // Start animations
    _confettiController.repeat();
    _contentController.forward();
  }

  void _generateParticles() {
    final colors = [
      AppColors.primary,
      AppColors.secondary,
      AppColors.accent1,
      AppColors.accent2,
      AppColors.accent3,
      AppColors.accent4,
      Colors.white,
    ];

    for (int i = 0; i < 50; i++) {
      _particles.add(_ConfettiParticle(
        x: _random.nextDouble(),
        y: -_random.nextDouble() * 0.5,
        size: _random.nextDouble() * 8 + 4,
        color: colors[_random.nextInt(colors.length)],
        speed: _random.nextDouble() * 0.3 + 0.2,
        rotation: _random.nextDouble() * pi * 2,
        rotationSpeed: _random.nextDouble() * 0.1 - 0.05,
      ));
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          // Semi-transparent background
          GestureDetector(
            onTap: widget.onDismiss,
            child: AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Container(
                  color: Colors.black.withValues(alpha: _fadeAnimation.value * 0.6),
                );
              },
            ),
          ),

          // Confetti
          AnimatedBuilder(
            animation: _confettiController,
            builder: (context, child) {
              return CustomPaint(
                size: Size(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height),
                painter: _ConfettiPainter(
                  particles: _particles,
                  progress: _confettiController.value,
                ),
              );
            },
          ),

          // Content
          Center(
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Opacity(
                    opacity: _fadeAnimation.value,
                    child: child,
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(32.w),
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(28.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.3),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Emoji
                    Container(
                      width: 80.w,
                      height: 80.w,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: AppColors.celebrationGradient,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          widget.milestone.emoji,
                          style: TextStyle(fontSize: 40.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Week badge
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'Week ${widget.milestone.week}',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Title
                    Text(
                      widget.milestone.title,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.h),

                    // Message
                    Text(
                      widget.milestone.message,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),

                    // Baby size
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: AppColors.accent2.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.child_care,
                            color: AppColors.accent4,
                            size: 20.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Baby is now the size of ${widget.milestone.babySize}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),

                    // Dismiss button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: widget.onDismiss,
                        child: const Text('Continue'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConfettiParticle {
  double x;
  double y;
  final double size;
  final Color color;
  final double speed;
  double rotation;
  final double rotationSpeed;

  _ConfettiParticle({
    required this.x,
    required this.y,
    required this.size,
    required this.color,
    required this.speed,
    required this.rotation,
    required this.rotationSpeed,
  });
}

class _ConfettiPainter extends CustomPainter {
  final List<_ConfettiParticle> particles;
  final double progress;

  _ConfettiPainter({
    required this.particles,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in particles) {
      // Update position
      final y = particle.y + progress * particle.speed * 3;
      if (y > 1.2) continue;

      final x = particle.x + sin(progress * pi * 4 + particle.rotation) * 0.05;
      final rotation = particle.rotation + progress * particle.rotationSpeed * pi * 4;

      final paint = Paint()..color = particle.color.withValues(alpha: (1 - y).clamp(0.0, 1.0));

      canvas.save();
      canvas.translate(x * size.width, y * size.height);
      canvas.rotate(rotation);

      // Draw confetti shape (rectangle)
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset.zero,
            width: particle.size,
            height: particle.size * 0.6,
          ),
          Radius.circular(particle.size * 0.1),
        ),
        paint,
      );

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter oldDelegate) => true;
}

// Helper function to show celebration
void showMilestoneCelebration(BuildContext context, MilestoneInfo milestone) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    builder: (context) => CelebrationOverlay(
      milestone: milestone,
      onDismiss: () => Navigator.of(context).pop(),
    ),
  );
}

// Milestone card widget for displaying on dashboard
class MilestoneCard extends StatelessWidget {
  final int currentWeek;
  final VoidCallback? onTap;

  const MilestoneCard({
    super.key,
    required this.currentWeek,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final milestone = MilestoneHelper.getMilestoneInfo(currentWeek);
    final nextMilestone = MilestoneHelper.getNextMilestone(currentWeek);
    final weeksUntil = MilestoneHelper.weeksUntilNextMilestone(currentWeek);

    if (milestone != null) {
      // Current week is a milestone
      return GestureDetector(
        onTap: onTap ?? () => showMilestoneCelebration(context, milestone),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: AppColors.celebrationGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    milestone.emoji,
                    style: TextStyle(fontSize: 24.sp),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      milestone.title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Tap to celebrate! 🎉',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.celebration_outlined,
                color: Colors.white,
                size: 24.sp,
              ),
            ],
          ),
        ),
      );
    }

    if (nextMilestone != null && weeksUntil != null) {
      // Show next milestone preview
      final nextMilestoneInfo = MilestoneHelper.getMilestoneInfo(nextMilestone);

      return Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: AppColors.primaryLight,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Text(
                  nextMilestoneInfo?.emoji ?? '🎯',
                  style: TextStyle(fontSize: 24.sp),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Next milestone: Week $nextMilestone',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '$weeksUntil ${weeksUntil == 1 ? 'week' : 'weeks'} to go',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
