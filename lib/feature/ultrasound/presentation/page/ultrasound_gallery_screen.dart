import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
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
                  SizedBox(height: 8.h),
                  Text(
                    'Add images when recording a visit',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.textHint,
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
              final image = images[index];
              final imageDate =
                  DateTime.fromMillisecondsSinceEpoch(image.imageDate);

              return GestureDetector(
                onTap: () => _openGallery(context, images, index),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          File(image.imagePath),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: AppColors.inputBackground,
                              child: Icon(
                                Icons.broken_image,
                                size: 48.sp,
                                color: AppColors.textHint,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (image.pregnancyWeek != null)
                                  Text(
                                    'Week ${image.pregnancyWeek}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                Text(
                                  DateFormat('MMM d, y').format(imageDate),
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _openGallery(
      BuildContext context, List<UltrasoundImage> images, int initialIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UltrasoundViewer(
          images: images,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

class UltrasoundViewer extends StatefulWidget {
  final List<UltrasoundImage> images;
  final int initialIndex;

  const UltrasoundViewer({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<UltrasoundViewer> createState() => _UltrasoundViewerState();
}

class _UltrasoundViewerState extends State<UltrasoundViewer> {
  late int _currentIndex;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentImage = widget.images[_currentIndex];
    final imageDate =
        DateTime.fromMillisecondsSinceEpoch(currentImage.imageDate);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (currentImage.pregnancyWeek != null)
              Text(
                'Week ${currentImage.pregnancyWeek}',
                style: TextStyle(fontSize: 16.sp),
              ),
            Text(
              DateFormat('MMMM d, y').format(imageDate),
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmDelete(context, currentImage),
          ),
        ],
      ),
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: FileImage(File(widget.images[index].imagePath)),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 3,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 64.sp,
                      color: AppColors.textHint,
                    ),
                  );
                },
              );
            },
            itemCount: widget.images.length,
            loadingBuilder: (context, event) => Center(
              child: CircularProgressIndicator(
                value: event == null
                    ? null
                    : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
              ),
            ),
            pageController: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '${_currentIndex + 1} / ${widget.images.length}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, UltrasoundImage image) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Image'),
        content: const Text(
            'Are you sure you want to delete this ultrasound image? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final db = Get.find<AppDatabase>();
      await db.deleteUltrasound(image.id);

      if (widget.images.length == 1) {
        Navigator.pop(context);
      } else {
        setState(() {
          widget.images.removeAt(_currentIndex);
          if (_currentIndex >= widget.images.length) {
            _currentIndex = widget.images.length - 1;
          }
        });
      }

      Get.snackbar(
        'Deleted',
        'Image deleted successfully',
        backgroundColor: AppColors.success,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
