import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

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
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

// Visits Table
class Visits extends Table {
  TextColumn get id => text()();
  IntColumn get visitDate => integer()();
  RealColumn get weightKg => real().nullable()();
  IntColumn get bloodPressureSystolic => integer().nullable()();
  IntColumn get bloodPressureDiastolic => integer().nullable()();
  IntColumn get babyHeartbeatBpm => integer().nullable()();
  TextColumn get generalNotes => text().nullable()();
  IntColumn get nextAppointmentDate => integer().nullable()();
  TextColumn get nextAppointmentNotes => text().nullable()();
  IntColumn get pregnancyWeekAtVisit => integer().nullable()();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

// Medications Table
class Medications extends Table {
  TextColumn get id => text()();
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
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // Handle future migrations here
      },
    );
  }

  // Pregnancy operations
  Future<List<Pregnancy>> getAllPregnancies() => select(pregnancies).get();

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

  // Visit operations
  Future<List<Visit>> getAllVisits() {
    return (select(visits)..orderBy([(t) => OrderingTerm.desc(t.visitDate)])).get();
  }

  Stream<List<Visit>> watchAllVisits() {
    return (select(visits)..orderBy([(t) => OrderingTerm.desc(t.visitDate)])).watch();
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
  Future<List<Medication>> getAllMedications() {
    return select(medications).get();
  }

  Future<List<Medication>> getActiveMedications() {
    return (select(medications)..where((t) => t.isActive.equals(true))).get();
  }

  Stream<List<Medication>> watchActiveMedications() {
    return (select(medications)..where((t) => t.isActive.equals(true))).watch();
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
  Future<List<LabResult>> getAllLabResults() {
    return (select(labResults)..orderBy([(t) => OrderingTerm.desc(t.testDate)])).get();
  }

  Stream<List<LabResult>> watchAllLabResults() {
    return (select(labResults)..orderBy([(t) => OrderingTerm.desc(t.testDate)])).watch();
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
  Future<List<UltrasoundImage>> getAllUltrasounds() {
    return (select(ultrasoundImages)..orderBy([(t) => OrderingTerm.desc(t.imageDate)])).get();
  }

  Stream<List<UltrasoundImage>> watchAllUltrasounds() {
    return (select(ultrasoundImages)..orderBy([(t) => OrderingTerm.desc(t.imageDate)])).watch();
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
  Future<List<Appointment>> getAllAppointments() {
    return (select(appointments)..orderBy([(t) => OrderingTerm.asc(t.appointmentDate)])).get();
  }

  Future<List<Appointment>> getUpcomingAppointments() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return (select(appointments)
      ..where((t) => t.appointmentDate.isBiggerOrEqualValue(now))
      ..orderBy([(t) => OrderingTerm.asc(t.appointmentDate)]))
      .get();
  }

  Stream<List<Appointment>> watchUpcomingAppointments() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return (select(appointments)
      ..where((t) => t.appointmentDate.isBiggerOrEqualValue(now))
      ..orderBy([(t) => OrderingTerm.asc(t.appointmentDate)]))
      .watch();
  }

  Future<Appointment?> getNextAppointment() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return (select(appointments)
      ..where((t) => t.appointmentDate.isBiggerOrEqualValue(now))
      ..orderBy([(t) => OrderingTerm.asc(t.appointmentDate)])
      ..limit(1))
      .getSingleOrNull();
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
