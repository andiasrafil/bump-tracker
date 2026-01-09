import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class FileHelper {
  static const _uuid = Uuid();
  static const _ultrasoundFolder = 'ultrasounds';
  static const _labResultsFolder = 'lab_results';

  /// Get app documents directory
  static Future<Directory> getAppDirectory() async {
    return await getApplicationDocumentsDirectory();
  }

  /// Pick image from camera
  static Future<File?> pickImageFromCamera({
    int maxWidth = 1920,
    int maxHeight = 1080,
    int quality = 85,
  }) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: maxWidth.toDouble(),
      maxHeight: maxHeight.toDouble(),
      imageQuality: quality,
    );

    if (pickedFile == null) return null;
    return File(pickedFile.path);
  }

  /// Pick image from gallery
  static Future<File?> pickImageFromGallery({
    int maxWidth = 1920,
    int maxHeight = 1080,
    int quality = 85,
  }) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: maxWidth.toDouble(),
      maxHeight: maxHeight.toDouble(),
      imageQuality: quality,
    );

    if (pickedFile == null) return null;
    return File(pickedFile.path);
  }

  /// Pick multiple images from gallery
  static Future<List<File>> pickMultipleImages({
    int maxWidth = 1920,
    int maxHeight = 1080,
    int quality = 85,
  }) async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage(
      maxWidth: maxWidth.toDouble(),
      maxHeight: maxHeight.toDouble(),
      imageQuality: quality,
    );

    return pickedFiles.map((xFile) => File(xFile.path)).toList();
  }

  /// Save ultrasound image to app storage
  static Future<String> saveUltrasoundImage(File imageFile) async {
    return _saveImage(imageFile, _ultrasoundFolder);
  }

  /// Save lab result image to app storage
  static Future<String> saveLabResultImage(File imageFile) async {
    return _saveImage(imageFile, _labResultsFolder);
  }

  /// Internal method to save and compress image
  static Future<String> _saveImage(File imageFile, String folder) async {
    final appDir = await getAppDirectory();
    final imagesDir = Directory('${appDir.path}/$folder');

    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }

    final extension = path.extension(imageFile.path).toLowerCase();
    final fileName = '${_uuid.v4()}$extension';
    final savedPath = '${imagesDir.path}/$fileName';

    // Compress image before saving
    final compressedFile = await FlutterImageCompress.compressAndGetFile(
      imageFile.absolute.path,
      savedPath,
      quality: 80,
      minWidth: 1024,
      minHeight: 1024,
    );

    if (compressedFile != null) {
      return compressedFile.path;
    }

    // Fallback: copy without compression
    await imageFile.copy(savedPath);
    return savedPath;
  }

  /// Delete image file
  static Future<bool> deleteImage(String imagePath) async {
    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  /// Delete multiple images
  static Future<void> deleteImages(List<String> imagePaths) async {
    for (final imagePath in imagePaths) {
      await deleteImage(imagePath);
    }
  }

  /// Get file size in MB
  static Future<double> getFileSizeInMB(String filePath) async {
    final file = File(filePath);
    if (await file.exists()) {
      final bytes = await file.length();
      return bytes / (1024 * 1024);
    }
    return 0;
  }

  /// Check if file exists
  static Future<bool> fileExists(String filePath) async {
    return await File(filePath).exists();
  }
}
