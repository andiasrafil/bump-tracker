import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

part 'database.g.dart';

// Pregnancy Profile Table
class Pregnancies extends Table {
  TextColumn get id => text()();
  IntColumn get lastMenstrualPeriod => integer().nullable()();
  IntColumn get dueDate => integer().nullable()();
  IntColumn get conceptionDate => integer().nullable()();
  TextColumn get doctorName => text().nullable()();
  TextColumn get hospitalName => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get babyName => text().nullable()();
  IntColumn get status => integer().withDefault(const Constant(0))(); // 0=active, 1=completed, 2=archived
  IntColumn get deliveryDate => integer().nullable()();
  IntColumn get babyWeightGrams => integer().nullable()();
  TextColumn get babyGender => text().nullable()(); // 'male', 'female', 'unknown'
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

// Visits Table
class Visits extends Table {
  TextColumn get id => text()();
  TextColumn get pregnancyId => text().references(Pregnancies, #id)();
  IntColumn get visitDate => integer()();
  RealColumn get weightKg => real().nullable()();
  IntColumn get bloodPressureSystolic => integer().nullable()();
  IntColumn get bloodPressureDiastolic => integer().nullable()();
  IntColumn get babyHeartbeatBpm => integer().nullable()();
  TextColumn get generalNotes => text().nullable()();
  IntColumn get nextAppointmentDate => integer().nullable()();
  TextColumn get nextAppointmentNotes => text().nullable()();
  IntColumn get pregnancyWeekAtVisit => integer().nullable()();
  IntColumn get mood => integer().nullable()(); // Maps to MoodType enum
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

// Medications Table
class Medications extends Table {
  TextColumn get id => text()();
  TextColumn get pregnancyId => text().references(Pregnancies, #id)();
  TextColumn get name => text()();
  TextColumn get dosage => text().nullable()();
  IntColumn get frequency => integer()();
  TextColumn get customFrequency => text().nullable()();
  TextColumn get prescribedBy => text().nullable()();
  IntColumn get startDate => integer().nullable()();
  IntColumn get endDate => integer().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  TextColumn get visitId => text().nullable().references(Visits, #id)();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

// Lab Results Table
class LabResults extends Table {
  TextColumn get id => text()();
  TextColumn get pregnancyId => text().references(Pregnancies, #id)();
  TextColumn get title => text()();
  IntColumn get type => integer()();
  IntColumn get testDate => integer()();
  TextColumn get textContent => text().nullable()();
  TextColumn get imagePaths => text().nullable()(); // JSON array
  TextColumn get visitId => text().nullable().references(Visits, #id)();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

// Ultrasound Images Table
class UltrasoundImages extends Table {
  TextColumn get id => text()();
  TextColumn get pregnancyId => text().references(Pregnancies, #id)();
  TextColumn get imagePath => text()();
  IntColumn get imageDate => integer()();
  IntColumn get pregnancyWeek => integer().nullable()();
  TextColumn get visitId => text().nullable().references(Visits, #id)();
  TextColumn get notes => text().nullable()();
  TextColumn get babyMeasurements => text().nullable()(); // JSON
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

// Appointments Table
class Appointments extends Table {
  TextColumn get id => text()();
  TextColumn get pregnancyId => text().references(Pregnancies, #id)();
  IntColumn get appointmentDate => integer()();
  TextColumn get purpose => text().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get doctorName => text().nullable()();
  TextColumn get notes => text().nullable()();
  BoolColumn get reminderSet => boolean().withDefault(const Constant(false))();
  IntColumn get reminderMinutesBefore => integer().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  Pregnancies,
  Visits,
  Medications,
  LabResults,
  UltrasoundImages,
  Appointments,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Migration from v1 to v2: Add pregnancyId to all related tables and mood to visits
          // Add new columns to pregnancies table
          await m.addColumn(pregnancies, pregnancies.babyName);
          await m.addColumn(pregnancies, pregnancies.status);
          await m.addColumn(pregnancies, pregnancies.deliveryDate);
          await m.addColumn(pregnancies, pregnancies.babyWeightGrams);
          await m.addColumn(pregnancies, pregnancies.babyGender);

          // Add pregnancyId and mood to visits table
          await m.addColumn(visits, visits.pregnancyId);
          await m.addColumn(visits, visits.mood);

          // Add pregnancyId to other tables
          await m.addColumn(medications, medications.pregnancyId);
          await m.addColumn(labResults, labResults.pregnancyId);
          await m.addColumn(ultrasoundImages, ultrasoundImages.pregnancyId);
          await m.addColumn(appointments, appointments.pregnancyId);

          // Migrate existing data: assign all records to the first pregnancy
          final prefs = await SharedPreferences.getInstance();
          final activePregnancyId = prefs.getString(AppConstants.prefActivePregnancyId);

          if (activePregnancyId != null) {
            await customStatement(
              'UPDATE visits SET pregnancy_id = ? WHERE pregnancy_id IS NULL',
              [activePregnancyId],
            );
            await customStatement(
              'UPDATE medications SET pregnancy_id = ? WHERE pregnancy_id IS NULL',
              [activePregnancyId],
            );
            await customStatement(
              'UPDATE lab_results SET pregnancy_id = ? WHERE pregnancy_id IS NULL',
              [activePregnancyId],
            );
            await customStatement(
              'UPDATE ultrasound_images SET pregnancy_id = ? WHERE pregnancy_id IS NULL',
              [activePregnancyId],
            );
            await customStatement(
              'UPDATE appointments SET pregnancy_id = ? WHERE pregnancy_id IS NULL',
              [activePregnancyId],
            );
          }
        }
      },
    );
  }

  // Pregnancy operations
  Future<List<Pregnancy>> getAllPregnancies() {
    return (select(pregnancies)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).get();
  }

  Stream<List<Pregnancy>> watchAllPregnancies() {
    return (select(pregnancies)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();
  }

  Future<Pregnancy?> getPregnancyById(String id) {
    return (select(pregnancies)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Stream<Pregnancy?> watchPregnancyById(String id) {
    return (select(pregnancies)..where((t) => t.id.equals(id))).watchSingleOrNull();
  }

  // Legacy methods for backwards compatibility (will be removed later)
  Stream<Pregnancy?> watchActivePregnancy() {
    return (select(pregnancies)..limit(1)).watchSingleOrNull();
  }

  Future<Pregnancy?> getActivePregnancy() {
    return (select(pregnancies)..limit(1)).getSingleOrNull();
  }

  Future<int> insertPregnancy(PregnanciesCompanion pregnancy) {
    return into(pregnancies).insert(pregnancy);
  }

  Future<bool> updatePregnancy(PregnanciesCompanion pregnancy) {
    return update(pregnancies).replace(pregnancy);
  }

  Future<int> deletePregnancy(String id) {
    return (delete(pregnancies)..where((t) => t.id.equals(id))).go();
  }

  // Visit operations
  Future<List<Visit>> getAllVisits({String? pregnancyId}) {
    final query = select(visits)..orderBy([(t) => OrderingTerm.desc(t.visitDate)]);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.get();
  }

  Stream<List<Visit>> watchAllVisits({String? pregnancyId}) {
    final query = select(visits)..orderBy([(t) => OrderingTerm.desc(t.visitDate)]);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.watch();
  }

  Future<Visit?> getVisitById(String id) {
    return (select(visits)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertVisit(VisitsCompanion visit) {
    return into(visits).insert(visit);
  }

  Future<bool> updateVisit(VisitsCompanion visit) {
    return update(visits).replace(visit);
  }

  Future<int> deleteVisit(String id) {
    return (delete(visits)..where((t) => t.id.equals(id))).go();
  }

  // Medication operations
  Future<List<Medication>> getAllMedications({String? pregnancyId}) {
    final query = select(medications);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.get();
  }

  Future<List<Medication>> getActiveMedications({String? pregnancyId}) {
    final query = select(medications)..where((t) => t.isActive.equals(true));
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.get();
  }

  Stream<List<Medication>> watchActiveMedications({String? pregnancyId}) {
    final query = select(medications)..where((t) => t.isActive.equals(true));
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.watch();
  }

  Future<int> insertMedication(MedicationsCompanion medication) {
    return into(medications).insert(medication);
  }

  Future<bool> updateMedication(MedicationsCompanion medication) {
    return update(medications).replace(medication);
  }

  Future<int> deleteMedication(String id) {
    return (delete(medications)..where((t) => t.id.equals(id))).go();
  }

  // Lab Result operations
  Future<List<LabResult>> getAllLabResults({String? pregnancyId}) {
    final query = select(labResults)..orderBy([(t) => OrderingTerm.desc(t.testDate)]);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.get();
  }

  Stream<List<LabResult>> watchAllLabResults({String? pregnancyId}) {
    final query = select(labResults)..orderBy([(t) => OrderingTerm.desc(t.testDate)]);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.watch();
  }

  Future<List<LabResult>> getLabResultsByVisit(String visitId) {
    return (select(labResults)..where((t) => t.visitId.equals(visitId))).get();
  }

  Future<int> insertLabResult(LabResultsCompanion labResult) {
    return into(labResults).insert(labResult);
  }

  Future<bool> updateLabResult(LabResultsCompanion labResult) {
    return update(labResults).replace(labResult);
  }

  Future<int> deleteLabResult(String id) {
    return (delete(labResults)..where((t) => t.id.equals(id))).go();
  }

  // Ultrasound operations
  Future<List<UltrasoundImage>> getAllUltrasounds({String? pregnancyId}) {
    final query = select(ultrasoundImages)..orderBy([(t) => OrderingTerm.desc(t.imageDate)]);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.get();
  }

  Stream<List<UltrasoundImage>> watchAllUltrasounds({String? pregnancyId}) {
    final query = select(ultrasoundImages)..orderBy([(t) => OrderingTerm.desc(t.imageDate)]);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.watch();
  }

  Future<List<UltrasoundImage>> getUltrasoundsByVisit(String visitId) {
    return (select(ultrasoundImages)..where((t) => t.visitId.equals(visitId))).get();
  }

  Future<int> insertUltrasound(UltrasoundImagesCompanion ultrasound) {
    return into(ultrasoundImages).insert(ultrasound);
  }

  Future<int> deleteUltrasound(String id) {
    return (delete(ultrasoundImages)..where((t) => t.id.equals(id))).go();
  }

  // Appointment operations
  Future<List<Appointment>> getAllAppointments({String? pregnancyId}) {
    final query = select(appointments)..orderBy([(t) => OrderingTerm.asc(t.appointmentDate)]);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.get();
  }

  Future<List<Appointment>> getUpcomingAppointments({String? pregnancyId}) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final query = select(appointments)
      ..where((t) => t.appointmentDate.isBiggerOrEqualValue(now))
      ..orderBy([(t) => OrderingTerm.asc(t.appointmentDate)]);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.get();
  }

  Stream<List<Appointment>> watchUpcomingAppointments({String? pregnancyId}) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final query = select(appointments)
      ..where((t) => t.appointmentDate.isBiggerOrEqualValue(now))
      ..orderBy([(t) => OrderingTerm.asc(t.appointmentDate)]);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.watch();
  }

  Future<Appointment?> getNextAppointment({String? pregnancyId}) {
    final now = DateTime.now().millisecondsSinceEpoch;
    final query = select(appointments)
      ..where((t) => t.appointmentDate.isBiggerOrEqualValue(now))
      ..orderBy([(t) => OrderingTerm.asc(t.appointmentDate)])
      ..limit(1);
    if (pregnancyId != null) {
      query.where((t) => t.pregnancyId.equals(pregnancyId));
    }
    return query.getSingleOrNull();
  }

  Future<int> insertAppointment(AppointmentsCompanion appointment) {
    return into(appointments).insert(appointment);
  }

  Future<bool> updateAppointment(AppointmentsCompanion appointment) {
    return update(appointments).replace(appointment);
  }

  Future<int> deleteAppointment(String id) {
    return (delete(appointments)..where((t) => t.id.equals(id))).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'bump_tracker.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
