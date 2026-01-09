import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'core/database/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize database
  final database = AppDatabase();
  Get.put(database);

  runApp(const BumpTrackerApp());
}
