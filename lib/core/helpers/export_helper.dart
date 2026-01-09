import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import '../database/database.dart';

class ExportHelper {
  static Future<Map<String, dynamic>> generateExportData(AppDatabase db) async {
    // Fetch all data
    final pregnancy = await db.getActivePregnancy();
    final visits = await db.getAllVisits();
    final medications = await db.getAllMedications();
    final ultrasounds = await db.getAllUltrasounds();
    final labResults = await db.getAllLabResults();
    final appointments = await db.getAllAppointments();

    // Build export object
    final exportData = {
      'exportDate': DateTime.now().toIso8601String(),
      'appVersion': '1.0.0',
      'pregnancy': pregnancy != null
          ? {
              'id': pregnancy.id,
              'lastMenstrualPeriod': pregnancy.lastMenstrualPeriod,
              'dueDate': pregnancy.dueDate,
              'doctorName': pregnancy.doctorName,
              'hospitalName': pregnancy.hospitalName,
              'notes': pregnancy.notes,
              'createdAt': pregnancy.createdAt,
            }
          : null,
      'visits': visits.map((v) => {
            'id': v.id,
            'visitDate': v.visitDate,
            'pregnancyWeekAtVisit': v.pregnancyWeekAtVisit,
            'weightKg': v.weightKg,
            'bloodPressureSystolic': v.bloodPressureSystolic,
            'bloodPressureDiastolic': v.bloodPressureDiastolic,
            'babyHeartbeatBpm': v.babyHeartbeatBpm,
            'generalNotes': v.generalNotes,
            'nextAppointmentDate': v.nextAppointmentDate,
            'nextAppointmentNotes': v.nextAppointmentNotes,
            'createdAt': v.createdAt,
          }).toList(),
      'medications': medications.map((m) => {
            'id': m.id,
            'name': m.name,
            'dosage': m.dosage,
            'frequency': m.frequency,
            'startDate': m.startDate,
            'endDate': m.endDate,
            'isActive': m.isActive,
            'notes': m.notes,
            'visitId': m.visitId,
            'createdAt': m.createdAt,
          }).toList(),
      'ultrasoundImages': ultrasounds.map((u) => {
            'id': u.id,
            'imagePath': u.imagePath,
            'imageDate': u.imageDate,
            'pregnancyWeek': u.pregnancyWeek,
            'notes': u.notes,
            'visitId': u.visitId,
            'createdAt': u.createdAt,
          }).toList(),
      'labResults': labResults.map((l) => {
            'id': l.id,
            'title': l.title,
            'type': l.type,
            'testDate': l.testDate,
            'textContent': l.textContent,
            'imagePaths': l.imagePaths,
            'notes': l.notes,
            'visitId': l.visitId,
            'createdAt': l.createdAt,
          }).toList(),
      'appointments': appointments.map((a) => {
            'id': a.id,
            'appointmentDate': a.appointmentDate,
            'purpose': a.purpose,
            'location': a.location,
            'doctorName': a.doctorName,
            'notes': a.notes,
            'reminderSet': a.reminderSet,
            'reminderMinutesBefore': a.reminderMinutesBefore,
            'createdAt': a.createdAt,
          }).toList(),
    };

    return exportData;
  }

  static Future<String> exportToJson(AppDatabase db) async {
    final exportData = await generateExportData(db);
    final jsonString = const JsonEncoder.withIndent('  ').convert(exportData);

    // Get directory
    final directory = await getApplicationDocumentsDirectory();
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final fileName = 'bumptracker_export_$timestamp.json';
    final filePath = '${directory.path}/$fileName';

    // Write file
    final file = File(filePath);
    await file.writeAsString(jsonString);

    return filePath;
  }

  static Future<void> shareExport(AppDatabase db) async {
    final filePath = await exportToJson(db);
    final file = XFile(filePath);
    await Share.shareXFiles(
      [file],
      subject: 'BumpTracker Data Export',
      text: 'My pregnancy tracking data from BumpTracker',
    );
  }

  static String formatExportSummary(Map<String, dynamic> exportData) {
    final visits = exportData['visits'] as List;
    final medications = exportData['medications'] as List;
    final ultrasounds = exportData['ultrasoundImages'] as List;
    final labResults = exportData['labResults'] as List;
    final appointments = exportData['appointments'] as List;

    return '''
Export Summary:
- Visits: ${visits.length}
- Medications: ${medications.length}
- Ultrasound images: ${ultrasounds.length}
- Lab results: ${labResults.length}
- Appointments: ${appointments.length}
''';
  }
}
