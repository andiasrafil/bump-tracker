import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_colors.dart';

class MoodPicker extends StatelessWidget {
  final int? selectedMood;
  final ValueChanged<int?> onMoodSelected;
  final bool showLabels;

  const MoodPicker({
    super.key,
    required this.selectedMood,
    required this.onMoodSelected,
    this.showLabels = true,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12.w,
      runSpacing: 12.h,
      children: List.generate(
        MoodType.values.length,
        (index) => _MoodItem(
          mood: MoodType.values[index],
          isSelected: selectedMood == index,
          onTap: () {
            if (selectedMood == index) {
              onMoodSelected(null);
            } else {
              onMoodSelected(index);
            }
          },
          showLabel: showLabels,
        ),
      ),
    );
  }
}

class _MoodItem extends StatefulWidget {
  final MoodType mood;
  final bool isSelected;
  final VoidCallback onTap;
  final bool showLabel;

  const _MoodItem({
    required this.mood,
    required this.isSelected,
    required this.onTap,
    required this.showLabel,
  });

  @override
  State<_MoodItem> createState() => _MoodItemState();
}

class _MoodItemState extends State<_MoodItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final moodColor = AppColors.getMoodColor(widget.mood.index);

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: child,
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.showLabel ? 72.w : 56.w,
          padding: EdgeInsets.symmetric(
            vertical: 8.h,
            horizontal: 4.w,
          ),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? moodColor.withOpacity(0.3)
                : AppColors.cardBackground,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: widget.isSelected ? moodColor : Colors.transparent,
              width: 2,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: moodColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedScale(
                scale: widget.isSelected ? 1.2 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: Text(
                  widget.mood.emoji,
                  style: TextStyle(fontSize: 28.sp),
                ),
              ),
              if (widget.showLabel) ...[
                SizedBox(height: 4.h),
                Text(
                  widget.mood.displayName,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight:
                        widget.isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: widget.isSelected
                        ? AppColors.textPrimary
                        : AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class MoodDisplay extends StatelessWidget {
  final int moodIndex;
  final bool showLabel;
  final double size;

  const MoodDisplay({
    super.key,
    required this.moodIndex,
    this.showLabel = true,
    this.size = 32,
  });

  @override
  Widget build(BuildContext context) {
    final mood = MoodType.values[moodIndex];
    final moodColor = AppColors.getMoodColor(moodIndex);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: showLabel ? 12.w : 8.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        color: moodColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            mood.emoji,
            style: TextStyle(fontSize: size.sp),
          ),
          if (showLabel) ...[
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mood.displayName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  mood.description,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class MoodBadge extends StatelessWidget {
  final int moodIndex;
  final double size;

  const MoodBadge({
    super.key,
    required this.moodIndex,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final mood = MoodType.values[moodIndex];
    final moodColor = AppColors.getMoodColor(moodIndex);

    return Container(
      width: size.w,
      height: size.w,
      decoration: BoxDecoration(
        color: moodColor.withOpacity(0.3),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          mood.emoji,
          style: TextStyle(fontSize: (size * 0.6).sp),
        ),
      ),
    );
  }
}
