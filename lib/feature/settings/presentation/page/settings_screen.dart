import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Pregnancy Profile'),
              subtitle: const Text('View and edit your pregnancy details'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          SizedBox(height: 12.h),
          Card(
            child: ListTile(
              leading: const Icon(Icons.file_download),
              title: const Text('Export Data'),
              subtitle: const Text('Export your pregnancy data to JSON'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
          SizedBox(height: 12.h),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              subtitle: const Text('BumpTracker v1.0.0'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
