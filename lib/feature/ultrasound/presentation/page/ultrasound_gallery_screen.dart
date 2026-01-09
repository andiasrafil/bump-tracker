import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/database/database.dart';

class UltrasoundGalleryScreen extends StatelessWidget {
  const UltrasoundGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = Get.find<AppDatabase>();

    return Scaffold(
      appBar: AppBar(title: const Text('Ultrasound Gallery')),
      body: StreamBuilder<List<UltrasoundImage>>(
        stream: db.watchAllUltrasounds(),
        builder: (context, snapshot) {
          final images = snapshot.data ?? [];

          if (images.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_library_outlined,
                    size: 64.sp,
                    color: AppColors.textHint,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'No ultrasound images yet',
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: EdgeInsets.all(16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 48),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
