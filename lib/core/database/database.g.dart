// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PregnanciesTable extends Pregnancies
    with TableInfo<$PregnanciesTable, Pregnancy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PregnanciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastMenstrualPeriodMeta =
      const VerificationMeta('lastMenstrualPeriod');
  @override
  late final GeneratedColumn<int> lastMenstrualPeriod = GeneratedColumn<int>(
    'last_menstrual_period',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<int> dueDate = GeneratedColumn<int>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _conceptionDateMeta = const VerificationMeta(
    'conceptionDate',
  );
  @override
  late final GeneratedColumn<int> conceptionDate = GeneratedColumn<int>(
    'conception_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _doctorNameMeta = const VerificationMeta(
    'doctorName',
  );
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
    'doctor_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _hospitalNameMeta = const VerificationMeta(
    'hospitalName',
  );
  @override
  late final GeneratedColumn<String> hospitalName = GeneratedColumn<String>(
    'hospital_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _babyNameMeta = const VerificationMeta(
    'babyName',
  );
  @override
  late final GeneratedColumn<String> babyName = GeneratedColumn<String>(
    'baby_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _deliveryDateMeta = const VerificationMeta(
    'deliveryDate',
  );
  @override
  late final GeneratedColumn<int> deliveryDate = GeneratedColumn<int>(
    'delivery_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _babyWeightGramsMeta = const VerificationMeta(
    'babyWeightGrams',
  );
  @override
  late final GeneratedColumn<int> babyWeightGrams = GeneratedColumn<int>(
    'baby_weight_grams',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _babyGenderMeta = const VerificationMeta(
    'babyGender',
  );
  @override
  late final GeneratedColumn<String> babyGender = GeneratedColumn<String>(
    'baby_gender',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lastMenstrualPeriod,
    dueDate,
    conceptionDate,
    doctorName,
    hospitalName,
    notes,
    babyName,
    status,
    deliveryDate,
    babyWeightGrams,
    babyGender,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pregnancies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Pregnancy> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('last_menstrual_period')) {
      context.handle(
        _lastMenstrualPeriodMeta,
        lastMenstrualPeriod.isAcceptableOrUnknown(
          data['last_menstrual_period']!,
          _lastMenstrualPeriodMeta,
        ),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    if (data.containsKey('conception_date')) {
      context.handle(
        _conceptionDateMeta,
        conceptionDate.isAcceptableOrUnknown(
          data['conception_date']!,
          _conceptionDateMeta,
        ),
      );
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
        _doctorNameMeta,
        doctorName.isAcceptableOrUnknown(data['doctor_name']!, _doctorNameMeta),
      );
    }
    if (data.containsKey('hospital_name')) {
      context.handle(
        _hospitalNameMeta,
        hospitalName.isAcceptableOrUnknown(
          data['hospital_name']!,
          _hospitalNameMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('baby_name')) {
      context.handle(
        _babyNameMeta,
        babyName.isAcceptableOrUnknown(data['baby_name']!, _babyNameMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('delivery_date')) {
      context.handle(
        _deliveryDateMeta,
        deliveryDate.isAcceptableOrUnknown(
          data['delivery_date']!,
          _deliveryDateMeta,
        ),
      );
    }
    if (data.containsKey('baby_weight_grams')) {
      context.handle(
        _babyWeightGramsMeta,
        babyWeightGrams.isAcceptableOrUnknown(
          data['baby_weight_grams']!,
          _babyWeightGramsMeta,
        ),
      );
    }
    if (data.containsKey('baby_gender')) {
      context.handle(
        _babyGenderMeta,
        babyGender.isAcceptableOrUnknown(data['baby_gender']!, _babyGenderMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pregnancy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pregnancy(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      lastMenstrualPeriod: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_menstrual_period'],
      ),
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_date'],
      ),
      conceptionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}conception_date'],
      ),
      doctorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doctor_name'],
      ),
      hospitalName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hospital_name'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      babyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}baby_name'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}status'],
      )!,
      deliveryDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}delivery_date'],
      ),
      babyWeightGrams: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}baby_weight_grams'],
      ),
      babyGender: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}baby_gender'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PregnanciesTable createAlias(String alias) {
    return $PregnanciesTable(attachedDatabase, alias);
  }
}

class Pregnancy extends DataClass implements Insertable<Pregnancy> {
  final String id;
  final int? lastMenstrualPeriod;
  final int? dueDate;
  final int? conceptionDate;
  final String? doctorName;
  final String? hospitalName;
  final String? notes;
  final String? babyName;
  final int status;
  final int? deliveryDate;
  final int? babyWeightGrams;
  final String? babyGender;
  final int createdAt;
  final int updatedAt;
  const Pregnancy({
    required this.id,
    this.lastMenstrualPeriod,
    this.dueDate,
    this.conceptionDate,
    this.doctorName,
    this.hospitalName,
    this.notes,
    this.babyName,
    required this.status,
    this.deliveryDate,
    this.babyWeightGrams,
    this.babyGender,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || lastMenstrualPeriod != null) {
      map['last_menstrual_period'] = Variable<int>(lastMenstrualPeriod);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<int>(dueDate);
    }
    if (!nullToAbsent || conceptionDate != null) {
      map['conception_date'] = Variable<int>(conceptionDate);
    }
    if (!nullToAbsent || doctorName != null) {
      map['doctor_name'] = Variable<String>(doctorName);
    }
    if (!nullToAbsent || hospitalName != null) {
      map['hospital_name'] = Variable<String>(hospitalName);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || babyName != null) {
      map['baby_name'] = Variable<String>(babyName);
    }
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || deliveryDate != null) {
      map['delivery_date'] = Variable<int>(deliveryDate);
    }
    if (!nullToAbsent || babyWeightGrams != null) {
      map['baby_weight_grams'] = Variable<int>(babyWeightGrams);
    }
    if (!nullToAbsent || babyGender != null) {
      map['baby_gender'] = Variable<String>(babyGender);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  PregnanciesCompanion toCompanion(bool nullToAbsent) {
    return PregnanciesCompanion(
      id: Value(id),
      lastMenstrualPeriod: lastMenstrualPeriod == null && nullToAbsent
          ? const Value.absent()
          : Value(lastMenstrualPeriod),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
      conceptionDate: conceptionDate == null && nullToAbsent
          ? const Value.absent()
          : Value(conceptionDate),
      doctorName: doctorName == null && nullToAbsent
          ? const Value.absent()
          : Value(doctorName),
      hospitalName: hospitalName == null && nullToAbsent
          ? const Value.absent()
          : Value(hospitalName),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      babyName: babyName == null && nullToAbsent
          ? const Value.absent()
          : Value(babyName),
      status: Value(status),
      deliveryDate: deliveryDate == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryDate),
      babyWeightGrams: babyWeightGrams == null && nullToAbsent
          ? const Value.absent()
          : Value(babyWeightGrams),
      babyGender: babyGender == null && nullToAbsent
          ? const Value.absent()
          : Value(babyGender),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Pregnancy.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pregnancy(
      id: serializer.fromJson<String>(json['id']),
      lastMenstrualPeriod: serializer.fromJson<int?>(
        json['lastMenstrualPeriod'],
      ),
      dueDate: serializer.fromJson<int?>(json['dueDate']),
      conceptionDate: serializer.fromJson<int?>(json['conceptionDate']),
      doctorName: serializer.fromJson<String?>(json['doctorName']),
      hospitalName: serializer.fromJson<String?>(json['hospitalName']),
      notes: serializer.fromJson<String?>(json['notes']),
      babyName: serializer.fromJson<String?>(json['babyName']),
      status: serializer.fromJson<int>(json['status']),
      deliveryDate: serializer.fromJson<int?>(json['deliveryDate']),
      babyWeightGrams: serializer.fromJson<int?>(json['babyWeightGrams']),
      babyGender: serializer.fromJson<String?>(json['babyGender']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'lastMenstrualPeriod': serializer.toJson<int?>(lastMenstrualPeriod),
      'dueDate': serializer.toJson<int?>(dueDate),
      'conceptionDate': serializer.toJson<int?>(conceptionDate),
      'doctorName': serializer.toJson<String?>(doctorName),
      'hospitalName': serializer.toJson<String?>(hospitalName),
      'notes': serializer.toJson<String?>(notes),
      'babyName': serializer.toJson<String?>(babyName),
      'status': serializer.toJson<int>(status),
      'deliveryDate': serializer.toJson<int?>(deliveryDate),
      'babyWeightGrams': serializer.toJson<int?>(babyWeightGrams),
      'babyGender': serializer.toJson<String?>(babyGender),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Pregnancy copyWith({
    String? id,
    Value<int?> lastMenstrualPeriod = const Value.absent(),
    Value<int?> dueDate = const Value.absent(),
    Value<int?> conceptionDate = const Value.absent(),
    Value<String?> doctorName = const Value.absent(),
    Value<String?> hospitalName = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> babyName = const Value.absent(),
    int? status,
    Value<int?> deliveryDate = const Value.absent(),
    Value<int?> babyWeightGrams = const Value.absent(),
    Value<String?> babyGender = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => Pregnancy(
    id: id ?? this.id,
    lastMenstrualPeriod: lastMenstrualPeriod.present
        ? lastMenstrualPeriod.value
        : this.lastMenstrualPeriod,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
    conceptionDate: conceptionDate.present
        ? conceptionDate.value
        : this.conceptionDate,
    doctorName: doctorName.present ? doctorName.value : this.doctorName,
    hospitalName: hospitalName.present ? hospitalName.value : this.hospitalName,
    notes: notes.present ? notes.value : this.notes,
    babyName: babyName.present ? babyName.value : this.babyName,
    status: status ?? this.status,
    deliveryDate: deliveryDate.present ? deliveryDate.value : this.deliveryDate,
    babyWeightGrams: babyWeightGrams.present
        ? babyWeightGrams.value
        : this.babyWeightGrams,
    babyGender: babyGender.present ? babyGender.value : this.babyGender,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Pregnancy copyWithCompanion(PregnanciesCompanion data) {
    return Pregnancy(
      id: data.id.present ? data.id.value : this.id,
      lastMenstrualPeriod: data.lastMenstrualPeriod.present
          ? data.lastMenstrualPeriod.value
          : this.lastMenstrualPeriod,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
      conceptionDate: data.conceptionDate.present
          ? data.conceptionDate.value
          : this.conceptionDate,
      doctorName: data.doctorName.present
          ? data.doctorName.value
          : this.doctorName,
      hospitalName: data.hospitalName.present
          ? data.hospitalName.value
          : this.hospitalName,
      notes: data.notes.present ? data.notes.value : this.notes,
      babyName: data.babyName.present ? data.babyName.value : this.babyName,
      status: data.status.present ? data.status.value : this.status,
      deliveryDate: data.deliveryDate.present
          ? data.deliveryDate.value
          : this.deliveryDate,
      babyWeightGrams: data.babyWeightGrams.present
          ? data.babyWeightGrams.value
          : this.babyWeightGrams,
      babyGender: data.babyGender.present
          ? data.babyGender.value
          : this.babyGender,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pregnancy(')
          ..write('id: $id, ')
          ..write('lastMenstrualPeriod: $lastMenstrualPeriod, ')
          ..write('dueDate: $dueDate, ')
          ..write('conceptionDate: $conceptionDate, ')
          ..write('doctorName: $doctorName, ')
          ..write('hospitalName: $hospitalName, ')
          ..write('notes: $notes, ')
          ..write('babyName: $babyName, ')
          ..write('status: $status, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('babyWeightGrams: $babyWeightGrams, ')
          ..write('babyGender: $babyGender, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    lastMenstrualPeriod,
    dueDate,
    conceptionDate,
    doctorName,
    hospitalName,
    notes,
    babyName,
    status,
    deliveryDate,
    babyWeightGrams,
    babyGender,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pregnancy &&
          other.id == this.id &&
          other.lastMenstrualPeriod == this.lastMenstrualPeriod &&
          other.dueDate == this.dueDate &&
          other.conceptionDate == this.conceptionDate &&
          other.doctorName == this.doctorName &&
          other.hospitalName == this.hospitalName &&
          other.notes == this.notes &&
          other.babyName == this.babyName &&
          other.status == this.status &&
          other.deliveryDate == this.deliveryDate &&
          other.babyWeightGrams == this.babyWeightGrams &&
          other.babyGender == this.babyGender &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PregnanciesCompanion extends UpdateCompanion<Pregnancy> {
  final Value<String> id;
  final Value<int?> lastMenstrualPeriod;
  final Value<int?> dueDate;
  final Value<int?> conceptionDate;
  final Value<String?> doctorName;
  final Value<String?> hospitalName;
  final Value<String?> notes;
  final Value<String?> babyName;
  final Value<int> status;
  final Value<int?> deliveryDate;
  final Value<int?> babyWeightGrams;
  final Value<String?> babyGender;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const PregnanciesCompanion({
    this.id = const Value.absent(),
    this.lastMenstrualPeriod = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.conceptionDate = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.hospitalName = const Value.absent(),
    this.notes = const Value.absent(),
    this.babyName = const Value.absent(),
    this.status = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.babyWeightGrams = const Value.absent(),
    this.babyGender = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PregnanciesCompanion.insert({
    required String id,
    this.lastMenstrualPeriod = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.conceptionDate = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.hospitalName = const Value.absent(),
    this.notes = const Value.absent(),
    this.babyName = const Value.absent(),
    this.status = const Value.absent(),
    this.deliveryDate = const Value.absent(),
    this.babyWeightGrams = const Value.absent(),
    this.babyGender = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Pregnancy> custom({
    Expression<String>? id,
    Expression<int>? lastMenstrualPeriod,
    Expression<int>? dueDate,
    Expression<int>? conceptionDate,
    Expression<String>? doctorName,
    Expression<String>? hospitalName,
    Expression<String>? notes,
    Expression<String>? babyName,
    Expression<int>? status,
    Expression<int>? deliveryDate,
    Expression<int>? babyWeightGrams,
    Expression<String>? babyGender,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lastMenstrualPeriod != null)
        'last_menstrual_period': lastMenstrualPeriod,
      if (dueDate != null) 'due_date': dueDate,
      if (conceptionDate != null) 'conception_date': conceptionDate,
      if (doctorName != null) 'doctor_name': doctorName,
      if (hospitalName != null) 'hospital_name': hospitalName,
      if (notes != null) 'notes': notes,
      if (babyName != null) 'baby_name': babyName,
      if (status != null) 'status': status,
      if (deliveryDate != null) 'delivery_date': deliveryDate,
      if (babyWeightGrams != null) 'baby_weight_grams': babyWeightGrams,
      if (babyGender != null) 'baby_gender': babyGender,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PregnanciesCompanion copyWith({
    Value<String>? id,
    Value<int?>? lastMenstrualPeriod,
    Value<int?>? dueDate,
    Value<int?>? conceptionDate,
    Value<String?>? doctorName,
    Value<String?>? hospitalName,
    Value<String?>? notes,
    Value<String?>? babyName,
    Value<int>? status,
    Value<int?>? deliveryDate,
    Value<int?>? babyWeightGrams,
    Value<String?>? babyGender,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return PregnanciesCompanion(
      id: id ?? this.id,
      lastMenstrualPeriod: lastMenstrualPeriod ?? this.lastMenstrualPeriod,
      dueDate: dueDate ?? this.dueDate,
      conceptionDate: conceptionDate ?? this.conceptionDate,
      doctorName: doctorName ?? this.doctorName,
      hospitalName: hospitalName ?? this.hospitalName,
      notes: notes ?? this.notes,
      babyName: babyName ?? this.babyName,
      status: status ?? this.status,
      deliveryDate: deliveryDate ?? this.deliveryDate,
      babyWeightGrams: babyWeightGrams ?? this.babyWeightGrams,
      babyGender: babyGender ?? this.babyGender,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (lastMenstrualPeriod.present) {
      map['last_menstrual_period'] = Variable<int>(lastMenstrualPeriod.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<int>(dueDate.value);
    }
    if (conceptionDate.present) {
      map['conception_date'] = Variable<int>(conceptionDate.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (hospitalName.present) {
      map['hospital_name'] = Variable<String>(hospitalName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (babyName.present) {
      map['baby_name'] = Variable<String>(babyName.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (deliveryDate.present) {
      map['delivery_date'] = Variable<int>(deliveryDate.value);
    }
    if (babyWeightGrams.present) {
      map['baby_weight_grams'] = Variable<int>(babyWeightGrams.value);
    }
    if (babyGender.present) {
      map['baby_gender'] = Variable<String>(babyGender.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PregnanciesCompanion(')
          ..write('id: $id, ')
          ..write('lastMenstrualPeriod: $lastMenstrualPeriod, ')
          ..write('dueDate: $dueDate, ')
          ..write('conceptionDate: $conceptionDate, ')
          ..write('doctorName: $doctorName, ')
          ..write('hospitalName: $hospitalName, ')
          ..write('notes: $notes, ')
          ..write('babyName: $babyName, ')
          ..write('status: $status, ')
          ..write('deliveryDate: $deliveryDate, ')
          ..write('babyWeightGrams: $babyWeightGrams, ')
          ..write('babyGender: $babyGender, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VisitsTable extends Visits with TableInfo<$VisitsTable, Visit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pregnancyIdMeta = const VerificationMeta(
    'pregnancyId',
  );
  @override
  late final GeneratedColumn<String> pregnancyId = GeneratedColumn<String>(
    'pregnancy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pregnancies (id)',
    ),
  );
  static const VerificationMeta _visitDateMeta = const VerificationMeta(
    'visitDate',
  );
  @override
  late final GeneratedColumn<int> visitDate = GeneratedColumn<int>(
    'visit_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightKgMeta = const VerificationMeta(
    'weightKg',
  );
  @override
  late final GeneratedColumn<double> weightKg = GeneratedColumn<double>(
    'weight_kg',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bloodPressureSystolicMeta =
      const VerificationMeta('bloodPressureSystolic');
  @override
  late final GeneratedColumn<int> bloodPressureSystolic = GeneratedColumn<int>(
    'blood_pressure_systolic',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _bloodPressureDiastolicMeta =
      const VerificationMeta('bloodPressureDiastolic');
  @override
  late final GeneratedColumn<int> bloodPressureDiastolic = GeneratedColumn<int>(
    'blood_pressure_diastolic',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _babyHeartbeatBpmMeta = const VerificationMeta(
    'babyHeartbeatBpm',
  );
  @override
  late final GeneratedColumn<int> babyHeartbeatBpm = GeneratedColumn<int>(
    'baby_heartbeat_bpm',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _generalNotesMeta = const VerificationMeta(
    'generalNotes',
  );
  @override
  late final GeneratedColumn<String> generalNotes = GeneratedColumn<String>(
    'general_notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextAppointmentDateMeta =
      const VerificationMeta('nextAppointmentDate');
  @override
  late final GeneratedColumn<int> nextAppointmentDate = GeneratedColumn<int>(
    'next_appointment_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nextAppointmentNotesMeta =
      const VerificationMeta('nextAppointmentNotes');
  @override
  late final GeneratedColumn<String> nextAppointmentNotes =
      GeneratedColumn<String>(
        'next_appointment_notes',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _pregnancyWeekAtVisitMeta =
      const VerificationMeta('pregnancyWeekAtVisit');
  @override
  late final GeneratedColumn<int> pregnancyWeekAtVisit = GeneratedColumn<int>(
    'pregnancy_week_at_visit',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _moodMeta = const VerificationMeta('mood');
  @override
  late final GeneratedColumn<int> mood = GeneratedColumn<int>(
    'mood',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pregnancyId,
    visitDate,
    weightKg,
    bloodPressureSystolic,
    bloodPressureDiastolic,
    babyHeartbeatBpm,
    generalNotes,
    nextAppointmentDate,
    nextAppointmentNotes,
    pregnancyWeekAtVisit,
    mood,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visits';
  @override
  VerificationContext validateIntegrity(
    Insertable<Visit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pregnancy_id')) {
      context.handle(
        _pregnancyIdMeta,
        pregnancyId.isAcceptableOrUnknown(
          data['pregnancy_id']!,
          _pregnancyIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pregnancyIdMeta);
    }
    if (data.containsKey('visit_date')) {
      context.handle(
        _visitDateMeta,
        visitDate.isAcceptableOrUnknown(data['visit_date']!, _visitDateMeta),
      );
    } else if (isInserting) {
      context.missing(_visitDateMeta);
    }
    if (data.containsKey('weight_kg')) {
      context.handle(
        _weightKgMeta,
        weightKg.isAcceptableOrUnknown(data['weight_kg']!, _weightKgMeta),
      );
    }
    if (data.containsKey('blood_pressure_systolic')) {
      context.handle(
        _bloodPressureSystolicMeta,
        bloodPressureSystolic.isAcceptableOrUnknown(
          data['blood_pressure_systolic']!,
          _bloodPressureSystolicMeta,
        ),
      );
    }
    if (data.containsKey('blood_pressure_diastolic')) {
      context.handle(
        _bloodPressureDiastolicMeta,
        bloodPressureDiastolic.isAcceptableOrUnknown(
          data['blood_pressure_diastolic']!,
          _bloodPressureDiastolicMeta,
        ),
      );
    }
    if (data.containsKey('baby_heartbeat_bpm')) {
      context.handle(
        _babyHeartbeatBpmMeta,
        babyHeartbeatBpm.isAcceptableOrUnknown(
          data['baby_heartbeat_bpm']!,
          _babyHeartbeatBpmMeta,
        ),
      );
    }
    if (data.containsKey('general_notes')) {
      context.handle(
        _generalNotesMeta,
        generalNotes.isAcceptableOrUnknown(
          data['general_notes']!,
          _generalNotesMeta,
        ),
      );
    }
    if (data.containsKey('next_appointment_date')) {
      context.handle(
        _nextAppointmentDateMeta,
        nextAppointmentDate.isAcceptableOrUnknown(
          data['next_appointment_date']!,
          _nextAppointmentDateMeta,
        ),
      );
    }
    if (data.containsKey('next_appointment_notes')) {
      context.handle(
        _nextAppointmentNotesMeta,
        nextAppointmentNotes.isAcceptableOrUnknown(
          data['next_appointment_notes']!,
          _nextAppointmentNotesMeta,
        ),
      );
    }
    if (data.containsKey('pregnancy_week_at_visit')) {
      context.handle(
        _pregnancyWeekAtVisitMeta,
        pregnancyWeekAtVisit.isAcceptableOrUnknown(
          data['pregnancy_week_at_visit']!,
          _pregnancyWeekAtVisitMeta,
        ),
      );
    }
    if (data.containsKey('mood')) {
      context.handle(
        _moodMeta,
        mood.isAcceptableOrUnknown(data['mood']!, _moodMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Visit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Visit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pregnancyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pregnancy_id'],
      )!,
      visitDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}visit_date'],
      )!,
      weightKg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}weight_kg'],
      ),
      bloodPressureSystolic: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}blood_pressure_systolic'],
      ),
      bloodPressureDiastolic: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}blood_pressure_diastolic'],
      ),
      babyHeartbeatBpm: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}baby_heartbeat_bpm'],
      ),
      generalNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}general_notes'],
      ),
      nextAppointmentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_appointment_date'],
      ),
      nextAppointmentNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_appointment_notes'],
      ),
      pregnancyWeekAtVisit: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pregnancy_week_at_visit'],
      ),
      mood: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mood'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $VisitsTable createAlias(String alias) {
    return $VisitsTable(attachedDatabase, alias);
  }
}

class Visit extends DataClass implements Insertable<Visit> {
  final String id;
  final String pregnancyId;
  final int visitDate;
  final double? weightKg;
  final int? bloodPressureSystolic;
  final int? bloodPressureDiastolic;
  final int? babyHeartbeatBpm;
  final String? generalNotes;
  final int? nextAppointmentDate;
  final String? nextAppointmentNotes;
  final int? pregnancyWeekAtVisit;
  final int? mood;
  final int createdAt;
  final int updatedAt;
  const Visit({
    required this.id,
    required this.pregnancyId,
    required this.visitDate,
    this.weightKg,
    this.bloodPressureSystolic,
    this.bloodPressureDiastolic,
    this.babyHeartbeatBpm,
    this.generalNotes,
    this.nextAppointmentDate,
    this.nextAppointmentNotes,
    this.pregnancyWeekAtVisit,
    this.mood,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pregnancy_id'] = Variable<String>(pregnancyId);
    map['visit_date'] = Variable<int>(visitDate);
    if (!nullToAbsent || weightKg != null) {
      map['weight_kg'] = Variable<double>(weightKg);
    }
    if (!nullToAbsent || bloodPressureSystolic != null) {
      map['blood_pressure_systolic'] = Variable<int>(bloodPressureSystolic);
    }
    if (!nullToAbsent || bloodPressureDiastolic != null) {
      map['blood_pressure_diastolic'] = Variable<int>(bloodPressureDiastolic);
    }
    if (!nullToAbsent || babyHeartbeatBpm != null) {
      map['baby_heartbeat_bpm'] = Variable<int>(babyHeartbeatBpm);
    }
    if (!nullToAbsent || generalNotes != null) {
      map['general_notes'] = Variable<String>(generalNotes);
    }
    if (!nullToAbsent || nextAppointmentDate != null) {
      map['next_appointment_date'] = Variable<int>(nextAppointmentDate);
    }
    if (!nullToAbsent || nextAppointmentNotes != null) {
      map['next_appointment_notes'] = Variable<String>(nextAppointmentNotes);
    }
    if (!nullToAbsent || pregnancyWeekAtVisit != null) {
      map['pregnancy_week_at_visit'] = Variable<int>(pregnancyWeekAtVisit);
    }
    if (!nullToAbsent || mood != null) {
      map['mood'] = Variable<int>(mood);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  VisitsCompanion toCompanion(bool nullToAbsent) {
    return VisitsCompanion(
      id: Value(id),
      pregnancyId: Value(pregnancyId),
      visitDate: Value(visitDate),
      weightKg: weightKg == null && nullToAbsent
          ? const Value.absent()
          : Value(weightKg),
      bloodPressureSystolic: bloodPressureSystolic == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodPressureSystolic),
      bloodPressureDiastolic: bloodPressureDiastolic == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodPressureDiastolic),
      babyHeartbeatBpm: babyHeartbeatBpm == null && nullToAbsent
          ? const Value.absent()
          : Value(babyHeartbeatBpm),
      generalNotes: generalNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(generalNotes),
      nextAppointmentDate: nextAppointmentDate == null && nullToAbsent
          ? const Value.absent()
          : Value(nextAppointmentDate),
      nextAppointmentNotes: nextAppointmentNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(nextAppointmentNotes),
      pregnancyWeekAtVisit: pregnancyWeekAtVisit == null && nullToAbsent
          ? const Value.absent()
          : Value(pregnancyWeekAtVisit),
      mood: mood == null && nullToAbsent ? const Value.absent() : Value(mood),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Visit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Visit(
      id: serializer.fromJson<String>(json['id']),
      pregnancyId: serializer.fromJson<String>(json['pregnancyId']),
      visitDate: serializer.fromJson<int>(json['visitDate']),
      weightKg: serializer.fromJson<double?>(json['weightKg']),
      bloodPressureSystolic: serializer.fromJson<int?>(
        json['bloodPressureSystolic'],
      ),
      bloodPressureDiastolic: serializer.fromJson<int?>(
        json['bloodPressureDiastolic'],
      ),
      babyHeartbeatBpm: serializer.fromJson<int?>(json['babyHeartbeatBpm']),
      generalNotes: serializer.fromJson<String?>(json['generalNotes']),
      nextAppointmentDate: serializer.fromJson<int?>(
        json['nextAppointmentDate'],
      ),
      nextAppointmentNotes: serializer.fromJson<String?>(
        json['nextAppointmentNotes'],
      ),
      pregnancyWeekAtVisit: serializer.fromJson<int?>(
        json['pregnancyWeekAtVisit'],
      ),
      mood: serializer.fromJson<int?>(json['mood']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pregnancyId': serializer.toJson<String>(pregnancyId),
      'visitDate': serializer.toJson<int>(visitDate),
      'weightKg': serializer.toJson<double?>(weightKg),
      'bloodPressureSystolic': serializer.toJson<int?>(bloodPressureSystolic),
      'bloodPressureDiastolic': serializer.toJson<int?>(bloodPressureDiastolic),
      'babyHeartbeatBpm': serializer.toJson<int?>(babyHeartbeatBpm),
      'generalNotes': serializer.toJson<String?>(generalNotes),
      'nextAppointmentDate': serializer.toJson<int?>(nextAppointmentDate),
      'nextAppointmentNotes': serializer.toJson<String?>(nextAppointmentNotes),
      'pregnancyWeekAtVisit': serializer.toJson<int?>(pregnancyWeekAtVisit),
      'mood': serializer.toJson<int?>(mood),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Visit copyWith({
    String? id,
    String? pregnancyId,
    int? visitDate,
    Value<double?> weightKg = const Value.absent(),
    Value<int?> bloodPressureSystolic = const Value.absent(),
    Value<int?> bloodPressureDiastolic = const Value.absent(),
    Value<int?> babyHeartbeatBpm = const Value.absent(),
    Value<String?> generalNotes = const Value.absent(),
    Value<int?> nextAppointmentDate = const Value.absent(),
    Value<String?> nextAppointmentNotes = const Value.absent(),
    Value<int?> pregnancyWeekAtVisit = const Value.absent(),
    Value<int?> mood = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => Visit(
    id: id ?? this.id,
    pregnancyId: pregnancyId ?? this.pregnancyId,
    visitDate: visitDate ?? this.visitDate,
    weightKg: weightKg.present ? weightKg.value : this.weightKg,
    bloodPressureSystolic: bloodPressureSystolic.present
        ? bloodPressureSystolic.value
        : this.bloodPressureSystolic,
    bloodPressureDiastolic: bloodPressureDiastolic.present
        ? bloodPressureDiastolic.value
        : this.bloodPressureDiastolic,
    babyHeartbeatBpm: babyHeartbeatBpm.present
        ? babyHeartbeatBpm.value
        : this.babyHeartbeatBpm,
    generalNotes: generalNotes.present ? generalNotes.value : this.generalNotes,
    nextAppointmentDate: nextAppointmentDate.present
        ? nextAppointmentDate.value
        : this.nextAppointmentDate,
    nextAppointmentNotes: nextAppointmentNotes.present
        ? nextAppointmentNotes.value
        : this.nextAppointmentNotes,
    pregnancyWeekAtVisit: pregnancyWeekAtVisit.present
        ? pregnancyWeekAtVisit.value
        : this.pregnancyWeekAtVisit,
    mood: mood.present ? mood.value : this.mood,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Visit copyWithCompanion(VisitsCompanion data) {
    return Visit(
      id: data.id.present ? data.id.value : this.id,
      pregnancyId: data.pregnancyId.present
          ? data.pregnancyId.value
          : this.pregnancyId,
      visitDate: data.visitDate.present ? data.visitDate.value : this.visitDate,
      weightKg: data.weightKg.present ? data.weightKg.value : this.weightKg,
      bloodPressureSystolic: data.bloodPressureSystolic.present
          ? data.bloodPressureSystolic.value
          : this.bloodPressureSystolic,
      bloodPressureDiastolic: data.bloodPressureDiastolic.present
          ? data.bloodPressureDiastolic.value
          : this.bloodPressureDiastolic,
      babyHeartbeatBpm: data.babyHeartbeatBpm.present
          ? data.babyHeartbeatBpm.value
          : this.babyHeartbeatBpm,
      generalNotes: data.generalNotes.present
          ? data.generalNotes.value
          : this.generalNotes,
      nextAppointmentDate: data.nextAppointmentDate.present
          ? data.nextAppointmentDate.value
          : this.nextAppointmentDate,
      nextAppointmentNotes: data.nextAppointmentNotes.present
          ? data.nextAppointmentNotes.value
          : this.nextAppointmentNotes,
      pregnancyWeekAtVisit: data.pregnancyWeekAtVisit.present
          ? data.pregnancyWeekAtVisit.value
          : this.pregnancyWeekAtVisit,
      mood: data.mood.present ? data.mood.value : this.mood,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Visit(')
          ..write('id: $id, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('visitDate: $visitDate, ')
          ..write('weightKg: $weightKg, ')
          ..write('bloodPressureSystolic: $bloodPressureSystolic, ')
          ..write('bloodPressureDiastolic: $bloodPressureDiastolic, ')
          ..write('babyHeartbeatBpm: $babyHeartbeatBpm, ')
          ..write('generalNotes: $generalNotes, ')
          ..write('nextAppointmentDate: $nextAppointmentDate, ')
          ..write('nextAppointmentNotes: $nextAppointmentNotes, ')
          ..write('pregnancyWeekAtVisit: $pregnancyWeekAtVisit, ')
          ..write('mood: $mood, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pregnancyId,
    visitDate,
    weightKg,
    bloodPressureSystolic,
    bloodPressureDiastolic,
    babyHeartbeatBpm,
    generalNotes,
    nextAppointmentDate,
    nextAppointmentNotes,
    pregnancyWeekAtVisit,
    mood,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Visit &&
          other.id == this.id &&
          other.pregnancyId == this.pregnancyId &&
          other.visitDate == this.visitDate &&
          other.weightKg == this.weightKg &&
          other.bloodPressureSystolic == this.bloodPressureSystolic &&
          other.bloodPressureDiastolic == this.bloodPressureDiastolic &&
          other.babyHeartbeatBpm == this.babyHeartbeatBpm &&
          other.generalNotes == this.generalNotes &&
          other.nextAppointmentDate == this.nextAppointmentDate &&
          other.nextAppointmentNotes == this.nextAppointmentNotes &&
          other.pregnancyWeekAtVisit == this.pregnancyWeekAtVisit &&
          other.mood == this.mood &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class VisitsCompanion extends UpdateCompanion<Visit> {
  final Value<String> id;
  final Value<String> pregnancyId;
  final Value<int> visitDate;
  final Value<double?> weightKg;
  final Value<int?> bloodPressureSystolic;
  final Value<int?> bloodPressureDiastolic;
  final Value<int?> babyHeartbeatBpm;
  final Value<String?> generalNotes;
  final Value<int?> nextAppointmentDate;
  final Value<String?> nextAppointmentNotes;
  final Value<int?> pregnancyWeekAtVisit;
  final Value<int?> mood;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const VisitsCompanion({
    this.id = const Value.absent(),
    this.pregnancyId = const Value.absent(),
    this.visitDate = const Value.absent(),
    this.weightKg = const Value.absent(),
    this.bloodPressureSystolic = const Value.absent(),
    this.bloodPressureDiastolic = const Value.absent(),
    this.babyHeartbeatBpm = const Value.absent(),
    this.generalNotes = const Value.absent(),
    this.nextAppointmentDate = const Value.absent(),
    this.nextAppointmentNotes = const Value.absent(),
    this.pregnancyWeekAtVisit = const Value.absent(),
    this.mood = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VisitsCompanion.insert({
    required String id,
    required String pregnancyId,
    required int visitDate,
    this.weightKg = const Value.absent(),
    this.bloodPressureSystolic = const Value.absent(),
    this.bloodPressureDiastolic = const Value.absent(),
    this.babyHeartbeatBpm = const Value.absent(),
    this.generalNotes = const Value.absent(),
    this.nextAppointmentDate = const Value.absent(),
    this.nextAppointmentNotes = const Value.absent(),
    this.pregnancyWeekAtVisit = const Value.absent(),
    this.mood = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       pregnancyId = Value(pregnancyId),
       visitDate = Value(visitDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Visit> custom({
    Expression<String>? id,
    Expression<String>? pregnancyId,
    Expression<int>? visitDate,
    Expression<double>? weightKg,
    Expression<int>? bloodPressureSystolic,
    Expression<int>? bloodPressureDiastolic,
    Expression<int>? babyHeartbeatBpm,
    Expression<String>? generalNotes,
    Expression<int>? nextAppointmentDate,
    Expression<String>? nextAppointmentNotes,
    Expression<int>? pregnancyWeekAtVisit,
    Expression<int>? mood,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pregnancyId != null) 'pregnancy_id': pregnancyId,
      if (visitDate != null) 'visit_date': visitDate,
      if (weightKg != null) 'weight_kg': weightKg,
      if (bloodPressureSystolic != null)
        'blood_pressure_systolic': bloodPressureSystolic,
      if (bloodPressureDiastolic != null)
        'blood_pressure_diastolic': bloodPressureDiastolic,
      if (babyHeartbeatBpm != null) 'baby_heartbeat_bpm': babyHeartbeatBpm,
      if (generalNotes != null) 'general_notes': generalNotes,
      if (nextAppointmentDate != null)
        'next_appointment_date': nextAppointmentDate,
      if (nextAppointmentNotes != null)
        'next_appointment_notes': nextAppointmentNotes,
      if (pregnancyWeekAtVisit != null)
        'pregnancy_week_at_visit': pregnancyWeekAtVisit,
      if (mood != null) 'mood': mood,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VisitsCompanion copyWith({
    Value<String>? id,
    Value<String>? pregnancyId,
    Value<int>? visitDate,
    Value<double?>? weightKg,
    Value<int?>? bloodPressureSystolic,
    Value<int?>? bloodPressureDiastolic,
    Value<int?>? babyHeartbeatBpm,
    Value<String?>? generalNotes,
    Value<int?>? nextAppointmentDate,
    Value<String?>? nextAppointmentNotes,
    Value<int?>? pregnancyWeekAtVisit,
    Value<int?>? mood,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return VisitsCompanion(
      id: id ?? this.id,
      pregnancyId: pregnancyId ?? this.pregnancyId,
      visitDate: visitDate ?? this.visitDate,
      weightKg: weightKg ?? this.weightKg,
      bloodPressureSystolic:
          bloodPressureSystolic ?? this.bloodPressureSystolic,
      bloodPressureDiastolic:
          bloodPressureDiastolic ?? this.bloodPressureDiastolic,
      babyHeartbeatBpm: babyHeartbeatBpm ?? this.babyHeartbeatBpm,
      generalNotes: generalNotes ?? this.generalNotes,
      nextAppointmentDate: nextAppointmentDate ?? this.nextAppointmentDate,
      nextAppointmentNotes: nextAppointmentNotes ?? this.nextAppointmentNotes,
      pregnancyWeekAtVisit: pregnancyWeekAtVisit ?? this.pregnancyWeekAtVisit,
      mood: mood ?? this.mood,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pregnancyId.present) {
      map['pregnancy_id'] = Variable<String>(pregnancyId.value);
    }
    if (visitDate.present) {
      map['visit_date'] = Variable<int>(visitDate.value);
    }
    if (weightKg.present) {
      map['weight_kg'] = Variable<double>(weightKg.value);
    }
    if (bloodPressureSystolic.present) {
      map['blood_pressure_systolic'] = Variable<int>(
        bloodPressureSystolic.value,
      );
    }
    if (bloodPressureDiastolic.present) {
      map['blood_pressure_diastolic'] = Variable<int>(
        bloodPressureDiastolic.value,
      );
    }
    if (babyHeartbeatBpm.present) {
      map['baby_heartbeat_bpm'] = Variable<int>(babyHeartbeatBpm.value);
    }
    if (generalNotes.present) {
      map['general_notes'] = Variable<String>(generalNotes.value);
    }
    if (nextAppointmentDate.present) {
      map['next_appointment_date'] = Variable<int>(nextAppointmentDate.value);
    }
    if (nextAppointmentNotes.present) {
      map['next_appointment_notes'] = Variable<String>(
        nextAppointmentNotes.value,
      );
    }
    if (pregnancyWeekAtVisit.present) {
      map['pregnancy_week_at_visit'] = Variable<int>(
        pregnancyWeekAtVisit.value,
      );
    }
    if (mood.present) {
      map['mood'] = Variable<int>(mood.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitsCompanion(')
          ..write('id: $id, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('visitDate: $visitDate, ')
          ..write('weightKg: $weightKg, ')
          ..write('bloodPressureSystolic: $bloodPressureSystolic, ')
          ..write('bloodPressureDiastolic: $bloodPressureDiastolic, ')
          ..write('babyHeartbeatBpm: $babyHeartbeatBpm, ')
          ..write('generalNotes: $generalNotes, ')
          ..write('nextAppointmentDate: $nextAppointmentDate, ')
          ..write('nextAppointmentNotes: $nextAppointmentNotes, ')
          ..write('pregnancyWeekAtVisit: $pregnancyWeekAtVisit, ')
          ..write('mood: $mood, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MedicationsTable extends Medications
    with TableInfo<$MedicationsTable, Medication> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MedicationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pregnancyIdMeta = const VerificationMeta(
    'pregnancyId',
  );
  @override
  late final GeneratedColumn<String> pregnancyId = GeneratedColumn<String>(
    'pregnancy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pregnancies (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dosageMeta = const VerificationMeta('dosage');
  @override
  late final GeneratedColumn<String> dosage = GeneratedColumn<String>(
    'dosage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _frequencyMeta = const VerificationMeta(
    'frequency',
  );
  @override
  late final GeneratedColumn<int> frequency = GeneratedColumn<int>(
    'frequency',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customFrequencyMeta = const VerificationMeta(
    'customFrequency',
  );
  @override
  late final GeneratedColumn<String> customFrequency = GeneratedColumn<String>(
    'custom_frequency',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _prescribedByMeta = const VerificationMeta(
    'prescribedBy',
  );
  @override
  late final GeneratedColumn<String> prescribedBy = GeneratedColumn<String>(
    'prescribed_by',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<int> startDate = GeneratedColumn<int>(
    'start_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<int> endDate = GeneratedColumn<int>(
    'end_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _visitIdMeta = const VerificationMeta(
    'visitId',
  );
  @override
  late final GeneratedColumn<String> visitId = GeneratedColumn<String>(
    'visit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES visits (id)',
    ),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pregnancyId,
    name,
    dosage,
    frequency,
    customFrequency,
    prescribedBy,
    startDate,
    endDate,
    notes,
    isActive,
    visitId,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'medications';
  @override
  VerificationContext validateIntegrity(
    Insertable<Medication> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pregnancy_id')) {
      context.handle(
        _pregnancyIdMeta,
        pregnancyId.isAcceptableOrUnknown(
          data['pregnancy_id']!,
          _pregnancyIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pregnancyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('dosage')) {
      context.handle(
        _dosageMeta,
        dosage.isAcceptableOrUnknown(data['dosage']!, _dosageMeta),
      );
    }
    if (data.containsKey('frequency')) {
      context.handle(
        _frequencyMeta,
        frequency.isAcceptableOrUnknown(data['frequency']!, _frequencyMeta),
      );
    } else if (isInserting) {
      context.missing(_frequencyMeta);
    }
    if (data.containsKey('custom_frequency')) {
      context.handle(
        _customFrequencyMeta,
        customFrequency.isAcceptableOrUnknown(
          data['custom_frequency']!,
          _customFrequencyMeta,
        ),
      );
    }
    if (data.containsKey('prescribed_by')) {
      context.handle(
        _prescribedByMeta,
        prescribedBy.isAcceptableOrUnknown(
          data['prescribed_by']!,
          _prescribedByMeta,
        ),
      );
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('visit_id')) {
      context.handle(
        _visitIdMeta,
        visitId.isAcceptableOrUnknown(data['visit_id']!, _visitIdMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Medication map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Medication(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pregnancyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pregnancy_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      dosage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}dosage'],
      ),
      frequency: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}frequency'],
      )!,
      customFrequency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}custom_frequency'],
      ),
      prescribedBy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prescribed_by'],
      ),
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_date'],
      ),
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_date'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      visitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visit_id'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $MedicationsTable createAlias(String alias) {
    return $MedicationsTable(attachedDatabase, alias);
  }
}

class Medication extends DataClass implements Insertable<Medication> {
  final String id;
  final String pregnancyId;
  final String name;
  final String? dosage;
  final int frequency;
  final String? customFrequency;
  final String? prescribedBy;
  final int? startDate;
  final int? endDate;
  final String? notes;
  final bool isActive;
  final String? visitId;
  final int createdAt;
  final int updatedAt;
  const Medication({
    required this.id,
    required this.pregnancyId,
    required this.name,
    this.dosage,
    required this.frequency,
    this.customFrequency,
    this.prescribedBy,
    this.startDate,
    this.endDate,
    this.notes,
    required this.isActive,
    this.visitId,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pregnancy_id'] = Variable<String>(pregnancyId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || dosage != null) {
      map['dosage'] = Variable<String>(dosage);
    }
    map['frequency'] = Variable<int>(frequency);
    if (!nullToAbsent || customFrequency != null) {
      map['custom_frequency'] = Variable<String>(customFrequency);
    }
    if (!nullToAbsent || prescribedBy != null) {
      map['prescribed_by'] = Variable<String>(prescribedBy);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<int>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<int>(endDate);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || visitId != null) {
      map['visit_id'] = Variable<String>(visitId);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  MedicationsCompanion toCompanion(bool nullToAbsent) {
    return MedicationsCompanion(
      id: Value(id),
      pregnancyId: Value(pregnancyId),
      name: Value(name),
      dosage: dosage == null && nullToAbsent
          ? const Value.absent()
          : Value(dosage),
      frequency: Value(frequency),
      customFrequency: customFrequency == null && nullToAbsent
          ? const Value.absent()
          : Value(customFrequency),
      prescribedBy: prescribedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(prescribedBy),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      isActive: Value(isActive),
      visitId: visitId == null && nullToAbsent
          ? const Value.absent()
          : Value(visitId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Medication.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Medication(
      id: serializer.fromJson<String>(json['id']),
      pregnancyId: serializer.fromJson<String>(json['pregnancyId']),
      name: serializer.fromJson<String>(json['name']),
      dosage: serializer.fromJson<String?>(json['dosage']),
      frequency: serializer.fromJson<int>(json['frequency']),
      customFrequency: serializer.fromJson<String?>(json['customFrequency']),
      prescribedBy: serializer.fromJson<String?>(json['prescribedBy']),
      startDate: serializer.fromJson<int?>(json['startDate']),
      endDate: serializer.fromJson<int?>(json['endDate']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      visitId: serializer.fromJson<String?>(json['visitId']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pregnancyId': serializer.toJson<String>(pregnancyId),
      'name': serializer.toJson<String>(name),
      'dosage': serializer.toJson<String?>(dosage),
      'frequency': serializer.toJson<int>(frequency),
      'customFrequency': serializer.toJson<String?>(customFrequency),
      'prescribedBy': serializer.toJson<String?>(prescribedBy),
      'startDate': serializer.toJson<int?>(startDate),
      'endDate': serializer.toJson<int?>(endDate),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'visitId': serializer.toJson<String?>(visitId),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Medication copyWith({
    String? id,
    String? pregnancyId,
    String? name,
    Value<String?> dosage = const Value.absent(),
    int? frequency,
    Value<String?> customFrequency = const Value.absent(),
    Value<String?> prescribedBy = const Value.absent(),
    Value<int?> startDate = const Value.absent(),
    Value<int?> endDate = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    bool? isActive,
    Value<String?> visitId = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => Medication(
    id: id ?? this.id,
    pregnancyId: pregnancyId ?? this.pregnancyId,
    name: name ?? this.name,
    dosage: dosage.present ? dosage.value : this.dosage,
    frequency: frequency ?? this.frequency,
    customFrequency: customFrequency.present
        ? customFrequency.value
        : this.customFrequency,
    prescribedBy: prescribedBy.present ? prescribedBy.value : this.prescribedBy,
    startDate: startDate.present ? startDate.value : this.startDate,
    endDate: endDate.present ? endDate.value : this.endDate,
    notes: notes.present ? notes.value : this.notes,
    isActive: isActive ?? this.isActive,
    visitId: visitId.present ? visitId.value : this.visitId,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Medication copyWithCompanion(MedicationsCompanion data) {
    return Medication(
      id: data.id.present ? data.id.value : this.id,
      pregnancyId: data.pregnancyId.present
          ? data.pregnancyId.value
          : this.pregnancyId,
      name: data.name.present ? data.name.value : this.name,
      dosage: data.dosage.present ? data.dosage.value : this.dosage,
      frequency: data.frequency.present ? data.frequency.value : this.frequency,
      customFrequency: data.customFrequency.present
          ? data.customFrequency.value
          : this.customFrequency,
      prescribedBy: data.prescribedBy.present
          ? data.prescribedBy.value
          : this.prescribedBy,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      visitId: data.visitId.present ? data.visitId.value : this.visitId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Medication(')
          ..write('id: $id, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('customFrequency: $customFrequency, ')
          ..write('prescribedBy: $prescribedBy, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('visitId: $visitId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pregnancyId,
    name,
    dosage,
    frequency,
    customFrequency,
    prescribedBy,
    startDate,
    endDate,
    notes,
    isActive,
    visitId,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Medication &&
          other.id == this.id &&
          other.pregnancyId == this.pregnancyId &&
          other.name == this.name &&
          other.dosage == this.dosage &&
          other.frequency == this.frequency &&
          other.customFrequency == this.customFrequency &&
          other.prescribedBy == this.prescribedBy &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.visitId == this.visitId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class MedicationsCompanion extends UpdateCompanion<Medication> {
  final Value<String> id;
  final Value<String> pregnancyId;
  final Value<String> name;
  final Value<String?> dosage;
  final Value<int> frequency;
  final Value<String?> customFrequency;
  final Value<String?> prescribedBy;
  final Value<int?> startDate;
  final Value<int?> endDate;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<String?> visitId;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const MedicationsCompanion({
    this.id = const Value.absent(),
    this.pregnancyId = const Value.absent(),
    this.name = const Value.absent(),
    this.dosage = const Value.absent(),
    this.frequency = const Value.absent(),
    this.customFrequency = const Value.absent(),
    this.prescribedBy = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.visitId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MedicationsCompanion.insert({
    required String id,
    required String pregnancyId,
    required String name,
    this.dosage = const Value.absent(),
    required int frequency,
    this.customFrequency = const Value.absent(),
    this.prescribedBy = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.visitId = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       pregnancyId = Value(pregnancyId),
       name = Value(name),
       frequency = Value(frequency),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Medication> custom({
    Expression<String>? id,
    Expression<String>? pregnancyId,
    Expression<String>? name,
    Expression<String>? dosage,
    Expression<int>? frequency,
    Expression<String>? customFrequency,
    Expression<String>? prescribedBy,
    Expression<int>? startDate,
    Expression<int>? endDate,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<String>? visitId,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pregnancyId != null) 'pregnancy_id': pregnancyId,
      if (name != null) 'name': name,
      if (dosage != null) 'dosage': dosage,
      if (frequency != null) 'frequency': frequency,
      if (customFrequency != null) 'custom_frequency': customFrequency,
      if (prescribedBy != null) 'prescribed_by': prescribedBy,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (visitId != null) 'visit_id': visitId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MedicationsCompanion copyWith({
    Value<String>? id,
    Value<String>? pregnancyId,
    Value<String>? name,
    Value<String?>? dosage,
    Value<int>? frequency,
    Value<String?>? customFrequency,
    Value<String?>? prescribedBy,
    Value<int?>? startDate,
    Value<int?>? endDate,
    Value<String?>? notes,
    Value<bool>? isActive,
    Value<String?>? visitId,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return MedicationsCompanion(
      id: id ?? this.id,
      pregnancyId: pregnancyId ?? this.pregnancyId,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      frequency: frequency ?? this.frequency,
      customFrequency: customFrequency ?? this.customFrequency,
      prescribedBy: prescribedBy ?? this.prescribedBy,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      visitId: visitId ?? this.visitId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pregnancyId.present) {
      map['pregnancy_id'] = Variable<String>(pregnancyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (dosage.present) {
      map['dosage'] = Variable<String>(dosage.value);
    }
    if (frequency.present) {
      map['frequency'] = Variable<int>(frequency.value);
    }
    if (customFrequency.present) {
      map['custom_frequency'] = Variable<String>(customFrequency.value);
    }
    if (prescribedBy.present) {
      map['prescribed_by'] = Variable<String>(prescribedBy.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<int>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<int>(endDate.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (visitId.present) {
      map['visit_id'] = Variable<String>(visitId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MedicationsCompanion(')
          ..write('id: $id, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('name: $name, ')
          ..write('dosage: $dosage, ')
          ..write('frequency: $frequency, ')
          ..write('customFrequency: $customFrequency, ')
          ..write('prescribedBy: $prescribedBy, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('visitId: $visitId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LabResultsTable extends LabResults
    with TableInfo<$LabResultsTable, LabResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LabResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pregnancyIdMeta = const VerificationMeta(
    'pregnancyId',
  );
  @override
  late final GeneratedColumn<String> pregnancyId = GeneratedColumn<String>(
    'pregnancy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pregnancies (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _testDateMeta = const VerificationMeta(
    'testDate',
  );
  @override
  late final GeneratedColumn<int> testDate = GeneratedColumn<int>(
    'test_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _textContentMeta = const VerificationMeta(
    'textContent',
  );
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
    'text_content',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imagePathsMeta = const VerificationMeta(
    'imagePaths',
  );
  @override
  late final GeneratedColumn<String> imagePaths = GeneratedColumn<String>(
    'image_paths',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _visitIdMeta = const VerificationMeta(
    'visitId',
  );
  @override
  late final GeneratedColumn<String> visitId = GeneratedColumn<String>(
    'visit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES visits (id)',
    ),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pregnancyId,
    title,
    type,
    testDate,
    textContent,
    imagePaths,
    visitId,
    notes,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lab_results';
  @override
  VerificationContext validateIntegrity(
    Insertable<LabResult> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pregnancy_id')) {
      context.handle(
        _pregnancyIdMeta,
        pregnancyId.isAcceptableOrUnknown(
          data['pregnancy_id']!,
          _pregnancyIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pregnancyIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('test_date')) {
      context.handle(
        _testDateMeta,
        testDate.isAcceptableOrUnknown(data['test_date']!, _testDateMeta),
      );
    } else if (isInserting) {
      context.missing(_testDateMeta);
    }
    if (data.containsKey('text_content')) {
      context.handle(
        _textContentMeta,
        textContent.isAcceptableOrUnknown(
          data['text_content']!,
          _textContentMeta,
        ),
      );
    }
    if (data.containsKey('image_paths')) {
      context.handle(
        _imagePathsMeta,
        imagePaths.isAcceptableOrUnknown(data['image_paths']!, _imagePathsMeta),
      );
    }
    if (data.containsKey('visit_id')) {
      context.handle(
        _visitIdMeta,
        visitId.isAcceptableOrUnknown(data['visit_id']!, _visitIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LabResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LabResult(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pregnancyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pregnancy_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type'],
      )!,
      testDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}test_date'],
      )!,
      textContent: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text_content'],
      ),
      imagePaths: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_paths'],
      ),
      visitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visit_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $LabResultsTable createAlias(String alias) {
    return $LabResultsTable(attachedDatabase, alias);
  }
}

class LabResult extends DataClass implements Insertable<LabResult> {
  final String id;
  final String pregnancyId;
  final String title;
  final int type;
  final int testDate;
  final String? textContent;
  final String? imagePaths;
  final String? visitId;
  final String? notes;
  final int createdAt;
  final int updatedAt;
  const LabResult({
    required this.id,
    required this.pregnancyId,
    required this.title,
    required this.type,
    required this.testDate,
    this.textContent,
    this.imagePaths,
    this.visitId,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pregnancy_id'] = Variable<String>(pregnancyId);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<int>(type);
    map['test_date'] = Variable<int>(testDate);
    if (!nullToAbsent || textContent != null) {
      map['text_content'] = Variable<String>(textContent);
    }
    if (!nullToAbsent || imagePaths != null) {
      map['image_paths'] = Variable<String>(imagePaths);
    }
    if (!nullToAbsent || visitId != null) {
      map['visit_id'] = Variable<String>(visitId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  LabResultsCompanion toCompanion(bool nullToAbsent) {
    return LabResultsCompanion(
      id: Value(id),
      pregnancyId: Value(pregnancyId),
      title: Value(title),
      type: Value(type),
      testDate: Value(testDate),
      textContent: textContent == null && nullToAbsent
          ? const Value.absent()
          : Value(textContent),
      imagePaths: imagePaths == null && nullToAbsent
          ? const Value.absent()
          : Value(imagePaths),
      visitId: visitId == null && nullToAbsent
          ? const Value.absent()
          : Value(visitId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory LabResult.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LabResult(
      id: serializer.fromJson<String>(json['id']),
      pregnancyId: serializer.fromJson<String>(json['pregnancyId']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<int>(json['type']),
      testDate: serializer.fromJson<int>(json['testDate']),
      textContent: serializer.fromJson<String?>(json['textContent']),
      imagePaths: serializer.fromJson<String?>(json['imagePaths']),
      visitId: serializer.fromJson<String?>(json['visitId']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pregnancyId': serializer.toJson<String>(pregnancyId),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<int>(type),
      'testDate': serializer.toJson<int>(testDate),
      'textContent': serializer.toJson<String?>(textContent),
      'imagePaths': serializer.toJson<String?>(imagePaths),
      'visitId': serializer.toJson<String?>(visitId),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  LabResult copyWith({
    String? id,
    String? pregnancyId,
    String? title,
    int? type,
    int? testDate,
    Value<String?> textContent = const Value.absent(),
    Value<String?> imagePaths = const Value.absent(),
    Value<String?> visitId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => LabResult(
    id: id ?? this.id,
    pregnancyId: pregnancyId ?? this.pregnancyId,
    title: title ?? this.title,
    type: type ?? this.type,
    testDate: testDate ?? this.testDate,
    textContent: textContent.present ? textContent.value : this.textContent,
    imagePaths: imagePaths.present ? imagePaths.value : this.imagePaths,
    visitId: visitId.present ? visitId.value : this.visitId,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  LabResult copyWithCompanion(LabResultsCompanion data) {
    return LabResult(
      id: data.id.present ? data.id.value : this.id,
      pregnancyId: data.pregnancyId.present
          ? data.pregnancyId.value
          : this.pregnancyId,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      testDate: data.testDate.present ? data.testDate.value : this.testDate,
      textContent: data.textContent.present
          ? data.textContent.value
          : this.textContent,
      imagePaths: data.imagePaths.present
          ? data.imagePaths.value
          : this.imagePaths,
      visitId: data.visitId.present ? data.visitId.value : this.visitId,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LabResult(')
          ..write('id: $id, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('testDate: $testDate, ')
          ..write('textContent: $textContent, ')
          ..write('imagePaths: $imagePaths, ')
          ..write('visitId: $visitId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pregnancyId,
    title,
    type,
    testDate,
    textContent,
    imagePaths,
    visitId,
    notes,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LabResult &&
          other.id == this.id &&
          other.pregnancyId == this.pregnancyId &&
          other.title == this.title &&
          other.type == this.type &&
          other.testDate == this.testDate &&
          other.textContent == this.textContent &&
          other.imagePaths == this.imagePaths &&
          other.visitId == this.visitId &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class LabResultsCompanion extends UpdateCompanion<LabResult> {
  final Value<String> id;
  final Value<String> pregnancyId;
  final Value<String> title;
  final Value<int> type;
  final Value<int> testDate;
  final Value<String?> textContent;
  final Value<String?> imagePaths;
  final Value<String?> visitId;
  final Value<String?> notes;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const LabResultsCompanion({
    this.id = const Value.absent(),
    this.pregnancyId = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.testDate = const Value.absent(),
    this.textContent = const Value.absent(),
    this.imagePaths = const Value.absent(),
    this.visitId = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LabResultsCompanion.insert({
    required String id,
    required String pregnancyId,
    required String title,
    required int type,
    required int testDate,
    this.textContent = const Value.absent(),
    this.imagePaths = const Value.absent(),
    this.visitId = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       pregnancyId = Value(pregnancyId),
       title = Value(title),
       type = Value(type),
       testDate = Value(testDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<LabResult> custom({
    Expression<String>? id,
    Expression<String>? pregnancyId,
    Expression<String>? title,
    Expression<int>? type,
    Expression<int>? testDate,
    Expression<String>? textContent,
    Expression<String>? imagePaths,
    Expression<String>? visitId,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pregnancyId != null) 'pregnancy_id': pregnancyId,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (testDate != null) 'test_date': testDate,
      if (textContent != null) 'text_content': textContent,
      if (imagePaths != null) 'image_paths': imagePaths,
      if (visitId != null) 'visit_id': visitId,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LabResultsCompanion copyWith({
    Value<String>? id,
    Value<String>? pregnancyId,
    Value<String>? title,
    Value<int>? type,
    Value<int>? testDate,
    Value<String?>? textContent,
    Value<String?>? imagePaths,
    Value<String?>? visitId,
    Value<String?>? notes,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return LabResultsCompanion(
      id: id ?? this.id,
      pregnancyId: pregnancyId ?? this.pregnancyId,
      title: title ?? this.title,
      type: type ?? this.type,
      testDate: testDate ?? this.testDate,
      textContent: textContent ?? this.textContent,
      imagePaths: imagePaths ?? this.imagePaths,
      visitId: visitId ?? this.visitId,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pregnancyId.present) {
      map['pregnancy_id'] = Variable<String>(pregnancyId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (testDate.present) {
      map['test_date'] = Variable<int>(testDate.value);
    }
    if (textContent.present) {
      map['text_content'] = Variable<String>(textContent.value);
    }
    if (imagePaths.present) {
      map['image_paths'] = Variable<String>(imagePaths.value);
    }
    if (visitId.present) {
      map['visit_id'] = Variable<String>(visitId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LabResultsCompanion(')
          ..write('id: $id, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('testDate: $testDate, ')
          ..write('textContent: $textContent, ')
          ..write('imagePaths: $imagePaths, ')
          ..write('visitId: $visitId, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UltrasoundImagesTable extends UltrasoundImages
    with TableInfo<$UltrasoundImagesTable, UltrasoundImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UltrasoundImagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pregnancyIdMeta = const VerificationMeta(
    'pregnancyId',
  );
  @override
  late final GeneratedColumn<String> pregnancyId = GeneratedColumn<String>(
    'pregnancy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pregnancies (id)',
    ),
  );
  static const VerificationMeta _imagePathMeta = const VerificationMeta(
    'imagePath',
  );
  @override
  late final GeneratedColumn<String> imagePath = GeneratedColumn<String>(
    'image_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageDateMeta = const VerificationMeta(
    'imageDate',
  );
  @override
  late final GeneratedColumn<int> imageDate = GeneratedColumn<int>(
    'image_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pregnancyWeekMeta = const VerificationMeta(
    'pregnancyWeek',
  );
  @override
  late final GeneratedColumn<int> pregnancyWeek = GeneratedColumn<int>(
    'pregnancy_week',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _visitIdMeta = const VerificationMeta(
    'visitId',
  );
  @override
  late final GeneratedColumn<String> visitId = GeneratedColumn<String>(
    'visit_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES visits (id)',
    ),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _babyMeasurementsMeta = const VerificationMeta(
    'babyMeasurements',
  );
  @override
  late final GeneratedColumn<String> babyMeasurements = GeneratedColumn<String>(
    'baby_measurements',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pregnancyId,
    imagePath,
    imageDate,
    pregnancyWeek,
    visitId,
    notes,
    babyMeasurements,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ultrasound_images';
  @override
  VerificationContext validateIntegrity(
    Insertable<UltrasoundImage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pregnancy_id')) {
      context.handle(
        _pregnancyIdMeta,
        pregnancyId.isAcceptableOrUnknown(
          data['pregnancy_id']!,
          _pregnancyIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pregnancyIdMeta);
    }
    if (data.containsKey('image_path')) {
      context.handle(
        _imagePathMeta,
        imagePath.isAcceptableOrUnknown(data['image_path']!, _imagePathMeta),
      );
    } else if (isInserting) {
      context.missing(_imagePathMeta);
    }
    if (data.containsKey('image_date')) {
      context.handle(
        _imageDateMeta,
        imageDate.isAcceptableOrUnknown(data['image_date']!, _imageDateMeta),
      );
    } else if (isInserting) {
      context.missing(_imageDateMeta);
    }
    if (data.containsKey('pregnancy_week')) {
      context.handle(
        _pregnancyWeekMeta,
        pregnancyWeek.isAcceptableOrUnknown(
          data['pregnancy_week']!,
          _pregnancyWeekMeta,
        ),
      );
    }
    if (data.containsKey('visit_id')) {
      context.handle(
        _visitIdMeta,
        visitId.isAcceptableOrUnknown(data['visit_id']!, _visitIdMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('baby_measurements')) {
      context.handle(
        _babyMeasurementsMeta,
        babyMeasurements.isAcceptableOrUnknown(
          data['baby_measurements']!,
          _babyMeasurementsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UltrasoundImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UltrasoundImage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pregnancyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pregnancy_id'],
      )!,
      imagePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_path'],
      )!,
      imageDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}image_date'],
      )!,
      pregnancyWeek: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pregnancy_week'],
      ),
      visitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}visit_id'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      babyMeasurements: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}baby_measurements'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $UltrasoundImagesTable createAlias(String alias) {
    return $UltrasoundImagesTable(attachedDatabase, alias);
  }
}

class UltrasoundImage extends DataClass implements Insertable<UltrasoundImage> {
  final String id;
  final String pregnancyId;
  final String imagePath;
  final int imageDate;
  final int? pregnancyWeek;
  final String? visitId;
  final String? notes;
  final String? babyMeasurements;
  final int createdAt;
  final int updatedAt;
  const UltrasoundImage({
    required this.id,
    required this.pregnancyId,
    required this.imagePath,
    required this.imageDate,
    this.pregnancyWeek,
    this.visitId,
    this.notes,
    this.babyMeasurements,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pregnancy_id'] = Variable<String>(pregnancyId);
    map['image_path'] = Variable<String>(imagePath);
    map['image_date'] = Variable<int>(imageDate);
    if (!nullToAbsent || pregnancyWeek != null) {
      map['pregnancy_week'] = Variable<int>(pregnancyWeek);
    }
    if (!nullToAbsent || visitId != null) {
      map['visit_id'] = Variable<String>(visitId);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || babyMeasurements != null) {
      map['baby_measurements'] = Variable<String>(babyMeasurements);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  UltrasoundImagesCompanion toCompanion(bool nullToAbsent) {
    return UltrasoundImagesCompanion(
      id: Value(id),
      pregnancyId: Value(pregnancyId),
      imagePath: Value(imagePath),
      imageDate: Value(imageDate),
      pregnancyWeek: pregnancyWeek == null && nullToAbsent
          ? const Value.absent()
          : Value(pregnancyWeek),
      visitId: visitId == null && nullToAbsent
          ? const Value.absent()
          : Value(visitId),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      babyMeasurements: babyMeasurements == null && nullToAbsent
          ? const Value.absent()
          : Value(babyMeasurements),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory UltrasoundImage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UltrasoundImage(
      id: serializer.fromJson<String>(json['id']),
      pregnancyId: serializer.fromJson<String>(json['pregnancyId']),
      imagePath: serializer.fromJson<String>(json['imagePath']),
      imageDate: serializer.fromJson<int>(json['imageDate']),
      pregnancyWeek: serializer.fromJson<int?>(json['pregnancyWeek']),
      visitId: serializer.fromJson<String?>(json['visitId']),
      notes: serializer.fromJson<String?>(json['notes']),
      babyMeasurements: serializer.fromJson<String?>(json['babyMeasurements']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pregnancyId': serializer.toJson<String>(pregnancyId),
      'imagePath': serializer.toJson<String>(imagePath),
      'imageDate': serializer.toJson<int>(imageDate),
      'pregnancyWeek': serializer.toJson<int?>(pregnancyWeek),
      'visitId': serializer.toJson<String?>(visitId),
      'notes': serializer.toJson<String?>(notes),
      'babyMeasurements': serializer.toJson<String?>(babyMeasurements),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  UltrasoundImage copyWith({
    String? id,
    String? pregnancyId,
    String? imagePath,
    int? imageDate,
    Value<int?> pregnancyWeek = const Value.absent(),
    Value<String?> visitId = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    Value<String?> babyMeasurements = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => UltrasoundImage(
    id: id ?? this.id,
    pregnancyId: pregnancyId ?? this.pregnancyId,
    imagePath: imagePath ?? this.imagePath,
    imageDate: imageDate ?? this.imageDate,
    pregnancyWeek: pregnancyWeek.present
        ? pregnancyWeek.value
        : this.pregnancyWeek,
    visitId: visitId.present ? visitId.value : this.visitId,
    notes: notes.present ? notes.value : this.notes,
    babyMeasurements: babyMeasurements.present
        ? babyMeasurements.value
        : this.babyMeasurements,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  UltrasoundImage copyWithCompanion(UltrasoundImagesCompanion data) {
    return UltrasoundImage(
      id: data.id.present ? data.id.value : this.id,
      pregnancyId: data.pregnancyId.present
          ? data.pregnancyId.value
          : this.pregnancyId,
      imagePath: data.imagePath.present ? data.imagePath.value : this.imagePath,
      imageDate: data.imageDate.present ? data.imageDate.value : this.imageDate,
      pregnancyWeek: data.pregnancyWeek.present
          ? data.pregnancyWeek.value
          : this.pregnancyWeek,
      visitId: data.visitId.present ? data.visitId.value : this.visitId,
      notes: data.notes.present ? data.notes.value : this.notes,
      babyMeasurements: data.babyMeasurements.present
          ? data.babyMeasurements.value
          : this.babyMeasurements,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UltrasoundImage(')
          ..write('id: $id, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageDate: $imageDate, ')
          ..write('pregnancyWeek: $pregnancyWeek, ')
          ..write('visitId: $visitId, ')
          ..write('notes: $notes, ')
          ..write('babyMeasurements: $babyMeasurements, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pregnancyId,
    imagePath,
    imageDate,
    pregnancyWeek,
    visitId,
    notes,
    babyMeasurements,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UltrasoundImage &&
          other.id == this.id &&
          other.pregnancyId == this.pregnancyId &&
          other.imagePath == this.imagePath &&
          other.imageDate == this.imageDate &&
          other.pregnancyWeek == this.pregnancyWeek &&
          other.visitId == this.visitId &&
          other.notes == this.notes &&
          other.babyMeasurements == this.babyMeasurements &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class UltrasoundImagesCompanion extends UpdateCompanion<UltrasoundImage> {
  final Value<String> id;
  final Value<String> pregnancyId;
  final Value<String> imagePath;
  final Value<int> imageDate;
  final Value<int?> pregnancyWeek;
  final Value<String?> visitId;
  final Value<String?> notes;
  final Value<String?> babyMeasurements;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const UltrasoundImagesCompanion({
    this.id = const Value.absent(),
    this.pregnancyId = const Value.absent(),
    this.imagePath = const Value.absent(),
    this.imageDate = const Value.absent(),
    this.pregnancyWeek = const Value.absent(),
    this.visitId = const Value.absent(),
    this.notes = const Value.absent(),
    this.babyMeasurements = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UltrasoundImagesCompanion.insert({
    required String id,
    required String pregnancyId,
    required String imagePath,
    required int imageDate,
    this.pregnancyWeek = const Value.absent(),
    this.visitId = const Value.absent(),
    this.notes = const Value.absent(),
    this.babyMeasurements = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       pregnancyId = Value(pregnancyId),
       imagePath = Value(imagePath),
       imageDate = Value(imageDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<UltrasoundImage> custom({
    Expression<String>? id,
    Expression<String>? pregnancyId,
    Expression<String>? imagePath,
    Expression<int>? imageDate,
    Expression<int>? pregnancyWeek,
    Expression<String>? visitId,
    Expression<String>? notes,
    Expression<String>? babyMeasurements,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pregnancyId != null) 'pregnancy_id': pregnancyId,
      if (imagePath != null) 'image_path': imagePath,
      if (imageDate != null) 'image_date': imageDate,
      if (pregnancyWeek != null) 'pregnancy_week': pregnancyWeek,
      if (visitId != null) 'visit_id': visitId,
      if (notes != null) 'notes': notes,
      if (babyMeasurements != null) 'baby_measurements': babyMeasurements,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UltrasoundImagesCompanion copyWith({
    Value<String>? id,
    Value<String>? pregnancyId,
    Value<String>? imagePath,
    Value<int>? imageDate,
    Value<int?>? pregnancyWeek,
    Value<String?>? visitId,
    Value<String?>? notes,
    Value<String?>? babyMeasurements,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return UltrasoundImagesCompanion(
      id: id ?? this.id,
      pregnancyId: pregnancyId ?? this.pregnancyId,
      imagePath: imagePath ?? this.imagePath,
      imageDate: imageDate ?? this.imageDate,
      pregnancyWeek: pregnancyWeek ?? this.pregnancyWeek,
      visitId: visitId ?? this.visitId,
      notes: notes ?? this.notes,
      babyMeasurements: babyMeasurements ?? this.babyMeasurements,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pregnancyId.present) {
      map['pregnancy_id'] = Variable<String>(pregnancyId.value);
    }
    if (imagePath.present) {
      map['image_path'] = Variable<String>(imagePath.value);
    }
    if (imageDate.present) {
      map['image_date'] = Variable<int>(imageDate.value);
    }
    if (pregnancyWeek.present) {
      map['pregnancy_week'] = Variable<int>(pregnancyWeek.value);
    }
    if (visitId.present) {
      map['visit_id'] = Variable<String>(visitId.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (babyMeasurements.present) {
      map['baby_measurements'] = Variable<String>(babyMeasurements.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UltrasoundImagesCompanion(')
          ..write('id: $id, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('imagePath: $imagePath, ')
          ..write('imageDate: $imageDate, ')
          ..write('pregnancyWeek: $pregnancyWeek, ')
          ..write('visitId: $visitId, ')
          ..write('notes: $notes, ')
          ..write('babyMeasurements: $babyMeasurements, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppointmentsTable extends Appointments
    with TableInfo<$AppointmentsTable, Appointment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppointmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pregnancyIdMeta = const VerificationMeta(
    'pregnancyId',
  );
  @override
  late final GeneratedColumn<String> pregnancyId = GeneratedColumn<String>(
    'pregnancy_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES pregnancies (id)',
    ),
  );
  static const VerificationMeta _appointmentDateMeta = const VerificationMeta(
    'appointmentDate',
  );
  @override
  late final GeneratedColumn<int> appointmentDate = GeneratedColumn<int>(
    'appointment_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _purposeMeta = const VerificationMeta(
    'purpose',
  );
  @override
  late final GeneratedColumn<String> purpose = GeneratedColumn<String>(
    'purpose',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _doctorNameMeta = const VerificationMeta(
    'doctorName',
  );
  @override
  late final GeneratedColumn<String> doctorName = GeneratedColumn<String>(
    'doctor_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _reminderSetMeta = const VerificationMeta(
    'reminderSet',
  );
  @override
  late final GeneratedColumn<bool> reminderSet = GeneratedColumn<bool>(
    'reminder_set',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("reminder_set" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _reminderMinutesBeforeMeta =
      const VerificationMeta('reminderMinutesBefore');
  @override
  late final GeneratedColumn<int> reminderMinutesBefore = GeneratedColumn<int>(
    'reminder_minutes_before',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    pregnancyId,
    appointmentDate,
    purpose,
    location,
    doctorName,
    notes,
    reminderSet,
    reminderMinutesBefore,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'appointments';
  @override
  VerificationContext validateIntegrity(
    Insertable<Appointment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pregnancy_id')) {
      context.handle(
        _pregnancyIdMeta,
        pregnancyId.isAcceptableOrUnknown(
          data['pregnancy_id']!,
          _pregnancyIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pregnancyIdMeta);
    }
    if (data.containsKey('appointment_date')) {
      context.handle(
        _appointmentDateMeta,
        appointmentDate.isAcceptableOrUnknown(
          data['appointment_date']!,
          _appointmentDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_appointmentDateMeta);
    }
    if (data.containsKey('purpose')) {
      context.handle(
        _purposeMeta,
        purpose.isAcceptableOrUnknown(data['purpose']!, _purposeMeta),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('doctor_name')) {
      context.handle(
        _doctorNameMeta,
        doctorName.isAcceptableOrUnknown(data['doctor_name']!, _doctorNameMeta),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('reminder_set')) {
      context.handle(
        _reminderSetMeta,
        reminderSet.isAcceptableOrUnknown(
          data['reminder_set']!,
          _reminderSetMeta,
        ),
      );
    }
    if (data.containsKey('reminder_minutes_before')) {
      context.handle(
        _reminderMinutesBeforeMeta,
        reminderMinutesBefore.isAcceptableOrUnknown(
          data['reminder_minutes_before']!,
          _reminderMinutesBeforeMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Appointment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Appointment(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      pregnancyId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pregnancy_id'],
      )!,
      appointmentDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}appointment_date'],
      )!,
      purpose: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purpose'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      doctorName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doctor_name'],
      ),
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      reminderSet: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}reminder_set'],
      )!,
      reminderMinutesBefore: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reminder_minutes_before'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppointmentsTable createAlias(String alias) {
    return $AppointmentsTable(attachedDatabase, alias);
  }
}

class Appointment extends DataClass implements Insertable<Appointment> {
  final String id;
  final String pregnancyId;
  final int appointmentDate;
  final String? purpose;
  final String? location;
  final String? doctorName;
  final String? notes;
  final bool reminderSet;
  final int? reminderMinutesBefore;
  final int createdAt;
  final int updatedAt;
  const Appointment({
    required this.id,
    required this.pregnancyId,
    required this.appointmentDate,
    this.purpose,
    this.location,
    this.doctorName,
    this.notes,
    required this.reminderSet,
    this.reminderMinutesBefore,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pregnancy_id'] = Variable<String>(pregnancyId);
    map['appointment_date'] = Variable<int>(appointmentDate);
    if (!nullToAbsent || purpose != null) {
      map['purpose'] = Variable<String>(purpose);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || doctorName != null) {
      map['doctor_name'] = Variable<String>(doctorName);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['reminder_set'] = Variable<bool>(reminderSet);
    if (!nullToAbsent || reminderMinutesBefore != null) {
      map['reminder_minutes_before'] = Variable<int>(reminderMinutesBefore);
    }
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  AppointmentsCompanion toCompanion(bool nullToAbsent) {
    return AppointmentsCompanion(
      id: Value(id),
      pregnancyId: Value(pregnancyId),
      appointmentDate: Value(appointmentDate),
      purpose: purpose == null && nullToAbsent
          ? const Value.absent()
          : Value(purpose),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      doctorName: doctorName == null && nullToAbsent
          ? const Value.absent()
          : Value(doctorName),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      reminderSet: Value(reminderSet),
      reminderMinutesBefore: reminderMinutesBefore == null && nullToAbsent
          ? const Value.absent()
          : Value(reminderMinutesBefore),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Appointment.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Appointment(
      id: serializer.fromJson<String>(json['id']),
      pregnancyId: serializer.fromJson<String>(json['pregnancyId']),
      appointmentDate: serializer.fromJson<int>(json['appointmentDate']),
      purpose: serializer.fromJson<String?>(json['purpose']),
      location: serializer.fromJson<String?>(json['location']),
      doctorName: serializer.fromJson<String?>(json['doctorName']),
      notes: serializer.fromJson<String?>(json['notes']),
      reminderSet: serializer.fromJson<bool>(json['reminderSet']),
      reminderMinutesBefore: serializer.fromJson<int?>(
        json['reminderMinutesBefore'],
      ),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pregnancyId': serializer.toJson<String>(pregnancyId),
      'appointmentDate': serializer.toJson<int>(appointmentDate),
      'purpose': serializer.toJson<String?>(purpose),
      'location': serializer.toJson<String?>(location),
      'doctorName': serializer.toJson<String?>(doctorName),
      'notes': serializer.toJson<String?>(notes),
      'reminderSet': serializer.toJson<bool>(reminderSet),
      'reminderMinutesBefore': serializer.toJson<int?>(reminderMinutesBefore),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Appointment copyWith({
    String? id,
    String? pregnancyId,
    int? appointmentDate,
    Value<String?> purpose = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<String?> doctorName = const Value.absent(),
    Value<String?> notes = const Value.absent(),
    bool? reminderSet,
    Value<int?> reminderMinutesBefore = const Value.absent(),
    int? createdAt,
    int? updatedAt,
  }) => Appointment(
    id: id ?? this.id,
    pregnancyId: pregnancyId ?? this.pregnancyId,
    appointmentDate: appointmentDate ?? this.appointmentDate,
    purpose: purpose.present ? purpose.value : this.purpose,
    location: location.present ? location.value : this.location,
    doctorName: doctorName.present ? doctorName.value : this.doctorName,
    notes: notes.present ? notes.value : this.notes,
    reminderSet: reminderSet ?? this.reminderSet,
    reminderMinutesBefore: reminderMinutesBefore.present
        ? reminderMinutesBefore.value
        : this.reminderMinutesBefore,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  Appointment copyWithCompanion(AppointmentsCompanion data) {
    return Appointment(
      id: data.id.present ? data.id.value : this.id,
      pregnancyId: data.pregnancyId.present
          ? data.pregnancyId.value
          : this.pregnancyId,
      appointmentDate: data.appointmentDate.present
          ? data.appointmentDate.value
          : this.appointmentDate,
      purpose: data.purpose.present ? data.purpose.value : this.purpose,
      location: data.location.present ? data.location.value : this.location,
      doctorName: data.doctorName.present
          ? data.doctorName.value
          : this.doctorName,
      notes: data.notes.present ? data.notes.value : this.notes,
      reminderSet: data.reminderSet.present
          ? data.reminderSet.value
          : this.reminderSet,
      reminderMinutesBefore: data.reminderMinutesBefore.present
          ? data.reminderMinutesBefore.value
          : this.reminderMinutesBefore,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Appointment(')
          ..write('id: $id, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('appointmentDate: $appointmentDate, ')
          ..write('purpose: $purpose, ')
          ..write('location: $location, ')
          ..write('doctorName: $doctorName, ')
          ..write('notes: $notes, ')
          ..write('reminderSet: $reminderSet, ')
          ..write('reminderMinutesBefore: $reminderMinutesBefore, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    pregnancyId,
    appointmentDate,
    purpose,
    location,
    doctorName,
    notes,
    reminderSet,
    reminderMinutesBefore,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Appointment &&
          other.id == this.id &&
          other.pregnancyId == this.pregnancyId &&
          other.appointmentDate == this.appointmentDate &&
          other.purpose == this.purpose &&
          other.location == this.location &&
          other.doctorName == this.doctorName &&
          other.notes == this.notes &&
          other.reminderSet == this.reminderSet &&
          other.reminderMinutesBefore == this.reminderMinutesBefore &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AppointmentsCompanion extends UpdateCompanion<Appointment> {
  final Value<String> id;
  final Value<String> pregnancyId;
  final Value<int> appointmentDate;
  final Value<String?> purpose;
  final Value<String?> location;
  final Value<String?> doctorName;
  final Value<String?> notes;
  final Value<bool> reminderSet;
  final Value<int?> reminderMinutesBefore;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const AppointmentsCompanion({
    this.id = const Value.absent(),
    this.pregnancyId = const Value.absent(),
    this.appointmentDate = const Value.absent(),
    this.purpose = const Value.absent(),
    this.location = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.notes = const Value.absent(),
    this.reminderSet = const Value.absent(),
    this.reminderMinutesBefore = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppointmentsCompanion.insert({
    required String id,
    required String pregnancyId,
    required int appointmentDate,
    this.purpose = const Value.absent(),
    this.location = const Value.absent(),
    this.doctorName = const Value.absent(),
    this.notes = const Value.absent(),
    this.reminderSet = const Value.absent(),
    this.reminderMinutesBefore = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       pregnancyId = Value(pregnancyId),
       appointmentDate = Value(appointmentDate),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Appointment> custom({
    Expression<String>? id,
    Expression<String>? pregnancyId,
    Expression<int>? appointmentDate,
    Expression<String>? purpose,
    Expression<String>? location,
    Expression<String>? doctorName,
    Expression<String>? notes,
    Expression<bool>? reminderSet,
    Expression<int>? reminderMinutesBefore,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pregnancyId != null) 'pregnancy_id': pregnancyId,
      if (appointmentDate != null) 'appointment_date': appointmentDate,
      if (purpose != null) 'purpose': purpose,
      if (location != null) 'location': location,
      if (doctorName != null) 'doctor_name': doctorName,
      if (notes != null) 'notes': notes,
      if (reminderSet != null) 'reminder_set': reminderSet,
      if (reminderMinutesBefore != null)
        'reminder_minutes_before': reminderMinutesBefore,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppointmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? pregnancyId,
    Value<int>? appointmentDate,
    Value<String?>? purpose,
    Value<String?>? location,
    Value<String?>? doctorName,
    Value<String?>? notes,
    Value<bool>? reminderSet,
    Value<int?>? reminderMinutesBefore,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int>? rowid,
  }) {
    return AppointmentsCompanion(
      id: id ?? this.id,
      pregnancyId: pregnancyId ?? this.pregnancyId,
      appointmentDate: appointmentDate ?? this.appointmentDate,
      purpose: purpose ?? this.purpose,
      location: location ?? this.location,
      doctorName: doctorName ?? this.doctorName,
      notes: notes ?? this.notes,
      reminderSet: reminderSet ?? this.reminderSet,
      reminderMinutesBefore:
          reminderMinutesBefore ?? this.reminderMinutesBefore,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pregnancyId.present) {
      map['pregnancy_id'] = Variable<String>(pregnancyId.value);
    }
    if (appointmentDate.present) {
      map['appointment_date'] = Variable<int>(appointmentDate.value);
    }
    if (purpose.present) {
      map['purpose'] = Variable<String>(purpose.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (doctorName.present) {
      map['doctor_name'] = Variable<String>(doctorName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (reminderSet.present) {
      map['reminder_set'] = Variable<bool>(reminderSet.value);
    }
    if (reminderMinutesBefore.present) {
      map['reminder_minutes_before'] = Variable<int>(
        reminderMinutesBefore.value,
      );
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppointmentsCompanion(')
          ..write('id: $id, ')
          ..write('pregnancyId: $pregnancyId, ')
          ..write('appointmentDate: $appointmentDate, ')
          ..write('purpose: $purpose, ')
          ..write('location: $location, ')
          ..write('doctorName: $doctorName, ')
          ..write('notes: $notes, ')
          ..write('reminderSet: $reminderSet, ')
          ..write('reminderMinutesBefore: $reminderMinutesBefore, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PregnanciesTable pregnancies = $PregnanciesTable(this);
  late final $VisitsTable visits = $VisitsTable(this);
  late final $MedicationsTable medications = $MedicationsTable(this);
  late final $LabResultsTable labResults = $LabResultsTable(this);
  late final $UltrasoundImagesTable ultrasoundImages = $UltrasoundImagesTable(
    this,
  );
  late final $AppointmentsTable appointments = $AppointmentsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    pregnancies,
    visits,
    medications,
    labResults,
    ultrasoundImages,
    appointments,
  ];
}

typedef $$PregnanciesTableCreateCompanionBuilder =
    PregnanciesCompanion Function({
      required String id,
      Value<int?> lastMenstrualPeriod,
      Value<int?> dueDate,
      Value<int?> conceptionDate,
      Value<String?> doctorName,
      Value<String?> hospitalName,
      Value<String?> notes,
      Value<String?> babyName,
      Value<int> status,
      Value<int?> deliveryDate,
      Value<int?> babyWeightGrams,
      Value<String?> babyGender,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$PregnanciesTableUpdateCompanionBuilder =
    PregnanciesCompanion Function({
      Value<String> id,
      Value<int?> lastMenstrualPeriod,
      Value<int?> dueDate,
      Value<int?> conceptionDate,
      Value<String?> doctorName,
      Value<String?> hospitalName,
      Value<String?> notes,
      Value<String?> babyName,
      Value<int> status,
      Value<int?> deliveryDate,
      Value<int?> babyWeightGrams,
      Value<String?> babyGender,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$PregnanciesTableReferences
    extends BaseReferences<_$AppDatabase, $PregnanciesTable, Pregnancy> {
  $$PregnanciesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VisitsTable, List<Visit>> _visitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.visits,
    aliasName: $_aliasNameGenerator(db.pregnancies.id, db.visits.pregnancyId),
  );

  $$VisitsTableProcessedTableManager get visitsRefs {
    final manager = $$VisitsTableTableManager(
      $_db,
      $_db.visits,
    ).filter((f) => f.pregnancyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_visitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MedicationsTable, List<Medication>>
  _medicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medications,
    aliasName: $_aliasNameGenerator(
      db.pregnancies.id,
      db.medications.pregnancyId,
    ),
  );

  $$MedicationsTableProcessedTableManager get medicationsRefs {
    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.pregnancyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_medicationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LabResultsTable, List<LabResult>>
  _labResultsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.labResults,
    aliasName: $_aliasNameGenerator(
      db.pregnancies.id,
      db.labResults.pregnancyId,
    ),
  );

  $$LabResultsTableProcessedTableManager get labResultsRefs {
    final manager = $$LabResultsTableTableManager(
      $_db,
      $_db.labResults,
    ).filter((f) => f.pregnancyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_labResultsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UltrasoundImagesTable, List<UltrasoundImage>>
  _ultrasoundImagesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ultrasoundImages,
    aliasName: $_aliasNameGenerator(
      db.pregnancies.id,
      db.ultrasoundImages.pregnancyId,
    ),
  );

  $$UltrasoundImagesTableProcessedTableManager get ultrasoundImagesRefs {
    final manager = $$UltrasoundImagesTableTableManager(
      $_db,
      $_db.ultrasoundImages,
    ).filter((f) => f.pregnancyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _ultrasoundImagesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AppointmentsTable, List<Appointment>>
  _appointmentsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.appointments,
    aliasName: $_aliasNameGenerator(
      db.pregnancies.id,
      db.appointments.pregnancyId,
    ),
  );

  $$AppointmentsTableProcessedTableManager get appointmentsRefs {
    final manager = $$AppointmentsTableTableManager(
      $_db,
      $_db.appointments,
    ).filter((f) => f.pregnancyId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_appointmentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PregnanciesTableFilterComposer
    extends Composer<_$AppDatabase, $PregnanciesTable> {
  $$PregnanciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastMenstrualPeriod => $composableBuilder(
    column: $table.lastMenstrualPeriod,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get conceptionDate => $composableBuilder(
    column: $table.conceptionDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hospitalName => $composableBuilder(
    column: $table.hospitalName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get babyName => $composableBuilder(
    column: $table.babyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get deliveryDate => $composableBuilder(
    column: $table.deliveryDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get babyWeightGrams => $composableBuilder(
    column: $table.babyWeightGrams,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get babyGender => $composableBuilder(
    column: $table.babyGender,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> visitsRefs(
    Expression<bool> Function($$VisitsTableFilterComposer f) f,
  ) {
    final $$VisitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableFilterComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> medicationsRefs(
    Expression<bool> Function($$MedicationsTableFilterComposer f) f,
  ) {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> labResultsRefs(
    Expression<bool> Function($$LabResultsTableFilterComposer f) f,
  ) {
    final $$LabResultsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.labResults,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabResultsTableFilterComposer(
            $db: $db,
            $table: $db.labResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ultrasoundImagesRefs(
    Expression<bool> Function($$UltrasoundImagesTableFilterComposer f) f,
  ) {
    final $$UltrasoundImagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ultrasoundImages,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UltrasoundImagesTableFilterComposer(
            $db: $db,
            $table: $db.ultrasoundImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> appointmentsRefs(
    Expression<bool> Function($$AppointmentsTableFilterComposer f) f,
  ) {
    final $$AppointmentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appointments,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentsTableFilterComposer(
            $db: $db,
            $table: $db.appointments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PregnanciesTableOrderingComposer
    extends Composer<_$AppDatabase, $PregnanciesTable> {
  $$PregnanciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastMenstrualPeriod => $composableBuilder(
    column: $table.lastMenstrualPeriod,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get conceptionDate => $composableBuilder(
    column: $table.conceptionDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hospitalName => $composableBuilder(
    column: $table.hospitalName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get babyName => $composableBuilder(
    column: $table.babyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get deliveryDate => $composableBuilder(
    column: $table.deliveryDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get babyWeightGrams => $composableBuilder(
    column: $table.babyWeightGrams,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get babyGender => $composableBuilder(
    column: $table.babyGender,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PregnanciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PregnanciesTable> {
  $$PregnanciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get lastMenstrualPeriod => $composableBuilder(
    column: $table.lastMenstrualPeriod,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  GeneratedColumn<int> get conceptionDate => $composableBuilder(
    column: $table.conceptionDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hospitalName => $composableBuilder(
    column: $table.hospitalName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get babyName =>
      $composableBuilder(column: $table.babyName, builder: (column) => column);

  GeneratedColumn<int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get deliveryDate => $composableBuilder(
    column: $table.deliveryDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get babyWeightGrams => $composableBuilder(
    column: $table.babyWeightGrams,
    builder: (column) => column,
  );

  GeneratedColumn<String> get babyGender => $composableBuilder(
    column: $table.babyGender,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> visitsRefs<T extends Object>(
    Expression<T> Function($$VisitsTableAnnotationComposer a) f,
  ) {
    final $$VisitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableAnnotationComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> medicationsRefs<T extends Object>(
    Expression<T> Function($$MedicationsTableAnnotationComposer a) f,
  ) {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> labResultsRefs<T extends Object>(
    Expression<T> Function($$LabResultsTableAnnotationComposer a) f,
  ) {
    final $$LabResultsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.labResults,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabResultsTableAnnotationComposer(
            $db: $db,
            $table: $db.labResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ultrasoundImagesRefs<T extends Object>(
    Expression<T> Function($$UltrasoundImagesTableAnnotationComposer a) f,
  ) {
    final $$UltrasoundImagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ultrasoundImages,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UltrasoundImagesTableAnnotationComposer(
            $db: $db,
            $table: $db.ultrasoundImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> appointmentsRefs<T extends Object>(
    Expression<T> Function($$AppointmentsTableAnnotationComposer a) f,
  ) {
    final $$AppointmentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.appointments,
      getReferencedColumn: (t) => t.pregnancyId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AppointmentsTableAnnotationComposer(
            $db: $db,
            $table: $db.appointments,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PregnanciesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PregnanciesTable,
          Pregnancy,
          $$PregnanciesTableFilterComposer,
          $$PregnanciesTableOrderingComposer,
          $$PregnanciesTableAnnotationComposer,
          $$PregnanciesTableCreateCompanionBuilder,
          $$PregnanciesTableUpdateCompanionBuilder,
          (Pregnancy, $$PregnanciesTableReferences),
          Pregnancy,
          PrefetchHooks Function({
            bool visitsRefs,
            bool medicationsRefs,
            bool labResultsRefs,
            bool ultrasoundImagesRefs,
            bool appointmentsRefs,
          })
        > {
  $$PregnanciesTableTableManager(_$AppDatabase db, $PregnanciesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PregnanciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PregnanciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PregnanciesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int?> lastMenstrualPeriod = const Value.absent(),
                Value<int?> dueDate = const Value.absent(),
                Value<int?> conceptionDate = const Value.absent(),
                Value<String?> doctorName = const Value.absent(),
                Value<String?> hospitalName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> babyName = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int?> deliveryDate = const Value.absent(),
                Value<int?> babyWeightGrams = const Value.absent(),
                Value<String?> babyGender = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PregnanciesCompanion(
                id: id,
                lastMenstrualPeriod: lastMenstrualPeriod,
                dueDate: dueDate,
                conceptionDate: conceptionDate,
                doctorName: doctorName,
                hospitalName: hospitalName,
                notes: notes,
                babyName: babyName,
                status: status,
                deliveryDate: deliveryDate,
                babyWeightGrams: babyWeightGrams,
                babyGender: babyGender,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<int?> lastMenstrualPeriod = const Value.absent(),
                Value<int?> dueDate = const Value.absent(),
                Value<int?> conceptionDate = const Value.absent(),
                Value<String?> doctorName = const Value.absent(),
                Value<String?> hospitalName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> babyName = const Value.absent(),
                Value<int> status = const Value.absent(),
                Value<int?> deliveryDate = const Value.absent(),
                Value<int?> babyWeightGrams = const Value.absent(),
                Value<String?> babyGender = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => PregnanciesCompanion.insert(
                id: id,
                lastMenstrualPeriod: lastMenstrualPeriod,
                dueDate: dueDate,
                conceptionDate: conceptionDate,
                doctorName: doctorName,
                hospitalName: hospitalName,
                notes: notes,
                babyName: babyName,
                status: status,
                deliveryDate: deliveryDate,
                babyWeightGrams: babyWeightGrams,
                babyGender: babyGender,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PregnanciesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                visitsRefs = false,
                medicationsRefs = false,
                labResultsRefs = false,
                ultrasoundImagesRefs = false,
                appointmentsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (visitsRefs) db.visits,
                    if (medicationsRefs) db.medications,
                    if (labResultsRefs) db.labResults,
                    if (ultrasoundImagesRefs) db.ultrasoundImages,
                    if (appointmentsRefs) db.appointments,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (visitsRefs)
                        await $_getPrefetchedData<
                          Pregnancy,
                          $PregnanciesTable,
                          Visit
                        >(
                          currentTable: table,
                          referencedTable: $$PregnanciesTableReferences
                              ._visitsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PregnanciesTableReferences(
                                db,
                                table,
                                p0,
                              ).visitsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pregnancyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (medicationsRefs)
                        await $_getPrefetchedData<
                          Pregnancy,
                          $PregnanciesTable,
                          Medication
                        >(
                          currentTable: table,
                          referencedTable: $$PregnanciesTableReferences
                              ._medicationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PregnanciesTableReferences(
                                db,
                                table,
                                p0,
                              ).medicationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pregnancyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (labResultsRefs)
                        await $_getPrefetchedData<
                          Pregnancy,
                          $PregnanciesTable,
                          LabResult
                        >(
                          currentTable: table,
                          referencedTable: $$PregnanciesTableReferences
                              ._labResultsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PregnanciesTableReferences(
                                db,
                                table,
                                p0,
                              ).labResultsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pregnancyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ultrasoundImagesRefs)
                        await $_getPrefetchedData<
                          Pregnancy,
                          $PregnanciesTable,
                          UltrasoundImage
                        >(
                          currentTable: table,
                          referencedTable: $$PregnanciesTableReferences
                              ._ultrasoundImagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PregnanciesTableReferences(
                                db,
                                table,
                                p0,
                              ).ultrasoundImagesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pregnancyId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (appointmentsRefs)
                        await $_getPrefetchedData<
                          Pregnancy,
                          $PregnanciesTable,
                          Appointment
                        >(
                          currentTable: table,
                          referencedTable: $$PregnanciesTableReferences
                              ._appointmentsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PregnanciesTableReferences(
                                db,
                                table,
                                p0,
                              ).appointmentsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.pregnancyId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PregnanciesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PregnanciesTable,
      Pregnancy,
      $$PregnanciesTableFilterComposer,
      $$PregnanciesTableOrderingComposer,
      $$PregnanciesTableAnnotationComposer,
      $$PregnanciesTableCreateCompanionBuilder,
      $$PregnanciesTableUpdateCompanionBuilder,
      (Pregnancy, $$PregnanciesTableReferences),
      Pregnancy,
      PrefetchHooks Function({
        bool visitsRefs,
        bool medicationsRefs,
        bool labResultsRefs,
        bool ultrasoundImagesRefs,
        bool appointmentsRefs,
      })
    >;
typedef $$VisitsTableCreateCompanionBuilder =
    VisitsCompanion Function({
      required String id,
      required String pregnancyId,
      required int visitDate,
      Value<double?> weightKg,
      Value<int?> bloodPressureSystolic,
      Value<int?> bloodPressureDiastolic,
      Value<int?> babyHeartbeatBpm,
      Value<String?> generalNotes,
      Value<int?> nextAppointmentDate,
      Value<String?> nextAppointmentNotes,
      Value<int?> pregnancyWeekAtVisit,
      Value<int?> mood,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$VisitsTableUpdateCompanionBuilder =
    VisitsCompanion Function({
      Value<String> id,
      Value<String> pregnancyId,
      Value<int> visitDate,
      Value<double?> weightKg,
      Value<int?> bloodPressureSystolic,
      Value<int?> bloodPressureDiastolic,
      Value<int?> babyHeartbeatBpm,
      Value<String?> generalNotes,
      Value<int?> nextAppointmentDate,
      Value<String?> nextAppointmentNotes,
      Value<int?> pregnancyWeekAtVisit,
      Value<int?> mood,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$VisitsTableReferences
    extends BaseReferences<_$AppDatabase, $VisitsTable, Visit> {
  $$VisitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PregnanciesTable _pregnancyIdTable(_$AppDatabase db) =>
      db.pregnancies.createAlias(
        $_aliasNameGenerator(db.visits.pregnancyId, db.pregnancies.id),
      );

  $$PregnanciesTableProcessedTableManager get pregnancyId {
    final $_column = $_itemColumn<String>('pregnancy_id')!;

    final manager = $$PregnanciesTableTableManager(
      $_db,
      $_db.pregnancies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pregnancyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$MedicationsTable, List<Medication>>
  _medicationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.medications,
    aliasName: $_aliasNameGenerator(db.visits.id, db.medications.visitId),
  );

  $$MedicationsTableProcessedTableManager get medicationsRefs {
    final manager = $$MedicationsTableTableManager(
      $_db,
      $_db.medications,
    ).filter((f) => f.visitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_medicationsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LabResultsTable, List<LabResult>>
  _labResultsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.labResults,
    aliasName: $_aliasNameGenerator(db.visits.id, db.labResults.visitId),
  );

  $$LabResultsTableProcessedTableManager get labResultsRefs {
    final manager = $$LabResultsTableTableManager(
      $_db,
      $_db.labResults,
    ).filter((f) => f.visitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_labResultsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UltrasoundImagesTable, List<UltrasoundImage>>
  _ultrasoundImagesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ultrasoundImages,
    aliasName: $_aliasNameGenerator(db.visits.id, db.ultrasoundImages.visitId),
  );

  $$UltrasoundImagesTableProcessedTableManager get ultrasoundImagesRefs {
    final manager = $$UltrasoundImagesTableTableManager(
      $_db,
      $_db.ultrasoundImages,
    ).filter((f) => f.visitId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _ultrasoundImagesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VisitsTableFilterComposer
    extends Composer<_$AppDatabase, $VisitsTable> {
  $$VisitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get visitDate => $composableBuilder(
    column: $table.visitDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bloodPressureSystolic => $composableBuilder(
    column: $table.bloodPressureSystolic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get bloodPressureDiastolic => $composableBuilder(
    column: $table.bloodPressureDiastolic,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get babyHeartbeatBpm => $composableBuilder(
    column: $table.babyHeartbeatBpm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get generalNotes => $composableBuilder(
    column: $table.generalNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextAppointmentDate => $composableBuilder(
    column: $table.nextAppointmentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextAppointmentNotes => $composableBuilder(
    column: $table.nextAppointmentNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pregnancyWeekAtVisit => $composableBuilder(
    column: $table.pregnancyWeekAtVisit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PregnanciesTableFilterComposer get pregnancyId {
    final $$PregnanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableFilterComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> medicationsRefs(
    Expression<bool> Function($$MedicationsTableFilterComposer f) f,
  ) {
    final $$MedicationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableFilterComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> labResultsRefs(
    Expression<bool> Function($$LabResultsTableFilterComposer f) f,
  ) {
    final $$LabResultsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.labResults,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabResultsTableFilterComposer(
            $db: $db,
            $table: $db.labResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ultrasoundImagesRefs(
    Expression<bool> Function($$UltrasoundImagesTableFilterComposer f) f,
  ) {
    final $$UltrasoundImagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ultrasoundImages,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UltrasoundImagesTableFilterComposer(
            $db: $db,
            $table: $db.ultrasoundImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VisitsTableOrderingComposer
    extends Composer<_$AppDatabase, $VisitsTable> {
  $$VisitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get visitDate => $composableBuilder(
    column: $table.visitDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weightKg => $composableBuilder(
    column: $table.weightKg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bloodPressureSystolic => $composableBuilder(
    column: $table.bloodPressureSystolic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get bloodPressureDiastolic => $composableBuilder(
    column: $table.bloodPressureDiastolic,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get babyHeartbeatBpm => $composableBuilder(
    column: $table.babyHeartbeatBpm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get generalNotes => $composableBuilder(
    column: $table.generalNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextAppointmentDate => $composableBuilder(
    column: $table.nextAppointmentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextAppointmentNotes => $composableBuilder(
    column: $table.nextAppointmentNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pregnancyWeekAtVisit => $composableBuilder(
    column: $table.pregnancyWeekAtVisit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mood => $composableBuilder(
    column: $table.mood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PregnanciesTableOrderingComposer get pregnancyId {
    final $$PregnanciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableOrderingComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VisitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VisitsTable> {
  $$VisitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get visitDate =>
      $composableBuilder(column: $table.visitDate, builder: (column) => column);

  GeneratedColumn<double> get weightKg =>
      $composableBuilder(column: $table.weightKg, builder: (column) => column);

  GeneratedColumn<int> get bloodPressureSystolic => $composableBuilder(
    column: $table.bloodPressureSystolic,
    builder: (column) => column,
  );

  GeneratedColumn<int> get bloodPressureDiastolic => $composableBuilder(
    column: $table.bloodPressureDiastolic,
    builder: (column) => column,
  );

  GeneratedColumn<int> get babyHeartbeatBpm => $composableBuilder(
    column: $table.babyHeartbeatBpm,
    builder: (column) => column,
  );

  GeneratedColumn<String> get generalNotes => $composableBuilder(
    column: $table.generalNotes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nextAppointmentDate => $composableBuilder(
    column: $table.nextAppointmentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nextAppointmentNotes => $composableBuilder(
    column: $table.nextAppointmentNotes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pregnancyWeekAtVisit => $composableBuilder(
    column: $table.pregnancyWeekAtVisit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mood =>
      $composableBuilder(column: $table.mood, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PregnanciesTableAnnotationComposer get pregnancyId {
    final $$PregnanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> medicationsRefs<T extends Object>(
    Expression<T> Function($$MedicationsTableAnnotationComposer a) f,
  ) {
    final $$MedicationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.medications,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MedicationsTableAnnotationComposer(
            $db: $db,
            $table: $db.medications,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> labResultsRefs<T extends Object>(
    Expression<T> Function($$LabResultsTableAnnotationComposer a) f,
  ) {
    final $$LabResultsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.labResults,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LabResultsTableAnnotationComposer(
            $db: $db,
            $table: $db.labResults,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ultrasoundImagesRefs<T extends Object>(
    Expression<T> Function($$UltrasoundImagesTableAnnotationComposer a) f,
  ) {
    final $$UltrasoundImagesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ultrasoundImages,
      getReferencedColumn: (t) => t.visitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UltrasoundImagesTableAnnotationComposer(
            $db: $db,
            $table: $db.ultrasoundImages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VisitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VisitsTable,
          Visit,
          $$VisitsTableFilterComposer,
          $$VisitsTableOrderingComposer,
          $$VisitsTableAnnotationComposer,
          $$VisitsTableCreateCompanionBuilder,
          $$VisitsTableUpdateCompanionBuilder,
          (Visit, $$VisitsTableReferences),
          Visit,
          PrefetchHooks Function({
            bool pregnancyId,
            bool medicationsRefs,
            bool labResultsRefs,
            bool ultrasoundImagesRefs,
          })
        > {
  $$VisitsTableTableManager(_$AppDatabase db, $VisitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VisitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VisitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VisitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pregnancyId = const Value.absent(),
                Value<int> visitDate = const Value.absent(),
                Value<double?> weightKg = const Value.absent(),
                Value<int?> bloodPressureSystolic = const Value.absent(),
                Value<int?> bloodPressureDiastolic = const Value.absent(),
                Value<int?> babyHeartbeatBpm = const Value.absent(),
                Value<String?> generalNotes = const Value.absent(),
                Value<int?> nextAppointmentDate = const Value.absent(),
                Value<String?> nextAppointmentNotes = const Value.absent(),
                Value<int?> pregnancyWeekAtVisit = const Value.absent(),
                Value<int?> mood = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VisitsCompanion(
                id: id,
                pregnancyId: pregnancyId,
                visitDate: visitDate,
                weightKg: weightKg,
                bloodPressureSystolic: bloodPressureSystolic,
                bloodPressureDiastolic: bloodPressureDiastolic,
                babyHeartbeatBpm: babyHeartbeatBpm,
                generalNotes: generalNotes,
                nextAppointmentDate: nextAppointmentDate,
                nextAppointmentNotes: nextAppointmentNotes,
                pregnancyWeekAtVisit: pregnancyWeekAtVisit,
                mood: mood,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String pregnancyId,
                required int visitDate,
                Value<double?> weightKg = const Value.absent(),
                Value<int?> bloodPressureSystolic = const Value.absent(),
                Value<int?> bloodPressureDiastolic = const Value.absent(),
                Value<int?> babyHeartbeatBpm = const Value.absent(),
                Value<String?> generalNotes = const Value.absent(),
                Value<int?> nextAppointmentDate = const Value.absent(),
                Value<String?> nextAppointmentNotes = const Value.absent(),
                Value<int?> pregnancyWeekAtVisit = const Value.absent(),
                Value<int?> mood = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => VisitsCompanion.insert(
                id: id,
                pregnancyId: pregnancyId,
                visitDate: visitDate,
                weightKg: weightKg,
                bloodPressureSystolic: bloodPressureSystolic,
                bloodPressureDiastolic: bloodPressureDiastolic,
                babyHeartbeatBpm: babyHeartbeatBpm,
                generalNotes: generalNotes,
                nextAppointmentDate: nextAppointmentDate,
                nextAppointmentNotes: nextAppointmentNotes,
                pregnancyWeekAtVisit: pregnancyWeekAtVisit,
                mood: mood,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$VisitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                pregnancyId = false,
                medicationsRefs = false,
                labResultsRefs = false,
                ultrasoundImagesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (medicationsRefs) db.medications,
                    if (labResultsRefs) db.labResults,
                    if (ultrasoundImagesRefs) db.ultrasoundImages,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (pregnancyId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.pregnancyId,
                                    referencedTable: $$VisitsTableReferences
                                        ._pregnancyIdTable(db),
                                    referencedColumn: $$VisitsTableReferences
                                        ._pregnancyIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (medicationsRefs)
                        await $_getPrefetchedData<
                          Visit,
                          $VisitsTable,
                          Medication
                        >(
                          currentTable: table,
                          referencedTable: $$VisitsTableReferences
                              ._medicationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VisitsTableReferences(
                                db,
                                table,
                                p0,
                              ).medicationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.visitId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (labResultsRefs)
                        await $_getPrefetchedData<
                          Visit,
                          $VisitsTable,
                          LabResult
                        >(
                          currentTable: table,
                          referencedTable: $$VisitsTableReferences
                              ._labResultsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VisitsTableReferences(
                                db,
                                table,
                                p0,
                              ).labResultsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.visitId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (ultrasoundImagesRefs)
                        await $_getPrefetchedData<
                          Visit,
                          $VisitsTable,
                          UltrasoundImage
                        >(
                          currentTable: table,
                          referencedTable: $$VisitsTableReferences
                              ._ultrasoundImagesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VisitsTableReferences(
                                db,
                                table,
                                p0,
                              ).ultrasoundImagesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.visitId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$VisitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VisitsTable,
      Visit,
      $$VisitsTableFilterComposer,
      $$VisitsTableOrderingComposer,
      $$VisitsTableAnnotationComposer,
      $$VisitsTableCreateCompanionBuilder,
      $$VisitsTableUpdateCompanionBuilder,
      (Visit, $$VisitsTableReferences),
      Visit,
      PrefetchHooks Function({
        bool pregnancyId,
        bool medicationsRefs,
        bool labResultsRefs,
        bool ultrasoundImagesRefs,
      })
    >;
typedef $$MedicationsTableCreateCompanionBuilder =
    MedicationsCompanion Function({
      required String id,
      required String pregnancyId,
      required String name,
      Value<String?> dosage,
      required int frequency,
      Value<String?> customFrequency,
      Value<String?> prescribedBy,
      Value<int?> startDate,
      Value<int?> endDate,
      Value<String?> notes,
      Value<bool> isActive,
      Value<String?> visitId,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$MedicationsTableUpdateCompanionBuilder =
    MedicationsCompanion Function({
      Value<String> id,
      Value<String> pregnancyId,
      Value<String> name,
      Value<String?> dosage,
      Value<int> frequency,
      Value<String?> customFrequency,
      Value<String?> prescribedBy,
      Value<int?> startDate,
      Value<int?> endDate,
      Value<String?> notes,
      Value<bool> isActive,
      Value<String?> visitId,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$MedicationsTableReferences
    extends BaseReferences<_$AppDatabase, $MedicationsTable, Medication> {
  $$MedicationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PregnanciesTable _pregnancyIdTable(_$AppDatabase db) =>
      db.pregnancies.createAlias(
        $_aliasNameGenerator(db.medications.pregnancyId, db.pregnancies.id),
      );

  $$PregnanciesTableProcessedTableManager get pregnancyId {
    final $_column = $_itemColumn<String>('pregnancy_id')!;

    final manager = $$PregnanciesTableTableManager(
      $_db,
      $_db.pregnancies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pregnancyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VisitsTable _visitIdTable(_$AppDatabase db) => db.visits.createAlias(
    $_aliasNameGenerator(db.medications.visitId, db.visits.id),
  );

  $$VisitsTableProcessedTableManager? get visitId {
    final $_column = $_itemColumn<String>('visit_id');
    if ($_column == null) return null;
    final manager = $$VisitsTableTableManager(
      $_db,
      $_db.visits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_visitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MedicationsTableFilterComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get customFrequency => $composableBuilder(
    column: $table.customFrequency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PregnanciesTableFilterComposer get pregnancyId {
    final $$PregnanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableFilterComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitsTableFilterComposer get visitId {
    final $$VisitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableFilterComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationsTableOrderingComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dosage => $composableBuilder(
    column: $table.dosage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get frequency => $composableBuilder(
    column: $table.frequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get customFrequency => $composableBuilder(
    column: $table.customFrequency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PregnanciesTableOrderingComposer get pregnancyId {
    final $$PregnanciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableOrderingComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitsTableOrderingComposer get visitId {
    final $$VisitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableOrderingComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MedicationsTable> {
  $$MedicationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get dosage =>
      $composableBuilder(column: $table.dosage, builder: (column) => column);

  GeneratedColumn<int> get frequency =>
      $composableBuilder(column: $table.frequency, builder: (column) => column);

  GeneratedColumn<String> get customFrequency => $composableBuilder(
    column: $table.customFrequency,
    builder: (column) => column,
  );

  GeneratedColumn<String> get prescribedBy => $composableBuilder(
    column: $table.prescribedBy,
    builder: (column) => column,
  );

  GeneratedColumn<int> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<int> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PregnanciesTableAnnotationComposer get pregnancyId {
    final $$PregnanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitsTableAnnotationComposer get visitId {
    final $$VisitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableAnnotationComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MedicationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MedicationsTable,
          Medication,
          $$MedicationsTableFilterComposer,
          $$MedicationsTableOrderingComposer,
          $$MedicationsTableAnnotationComposer,
          $$MedicationsTableCreateCompanionBuilder,
          $$MedicationsTableUpdateCompanionBuilder,
          (Medication, $$MedicationsTableReferences),
          Medication,
          PrefetchHooks Function({bool pregnancyId, bool visitId})
        > {
  $$MedicationsTableTableManager(_$AppDatabase db, $MedicationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MedicationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MedicationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MedicationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pregnancyId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> dosage = const Value.absent(),
                Value<int> frequency = const Value.absent(),
                Value<String?> customFrequency = const Value.absent(),
                Value<String?> prescribedBy = const Value.absent(),
                Value<int?> startDate = const Value.absent(),
                Value<int?> endDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> visitId = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion(
                id: id,
                pregnancyId: pregnancyId,
                name: name,
                dosage: dosage,
                frequency: frequency,
                customFrequency: customFrequency,
                prescribedBy: prescribedBy,
                startDate: startDate,
                endDate: endDate,
                notes: notes,
                isActive: isActive,
                visitId: visitId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String pregnancyId,
                required String name,
                Value<String?> dosage = const Value.absent(),
                required int frequency,
                Value<String?> customFrequency = const Value.absent(),
                Value<String?> prescribedBy = const Value.absent(),
                Value<int?> startDate = const Value.absent(),
                Value<int?> endDate = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<String?> visitId = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => MedicationsCompanion.insert(
                id: id,
                pregnancyId: pregnancyId,
                name: name,
                dosage: dosage,
                frequency: frequency,
                customFrequency: customFrequency,
                prescribedBy: prescribedBy,
                startDate: startDate,
                endDate: endDate,
                notes: notes,
                isActive: isActive,
                visitId: visitId,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MedicationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pregnancyId = false, visitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pregnancyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pregnancyId,
                                referencedTable: $$MedicationsTableReferences
                                    ._pregnancyIdTable(db),
                                referencedColumn: $$MedicationsTableReferences
                                    ._pregnancyIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (visitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.visitId,
                                referencedTable: $$MedicationsTableReferences
                                    ._visitIdTable(db),
                                referencedColumn: $$MedicationsTableReferences
                                    ._visitIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MedicationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MedicationsTable,
      Medication,
      $$MedicationsTableFilterComposer,
      $$MedicationsTableOrderingComposer,
      $$MedicationsTableAnnotationComposer,
      $$MedicationsTableCreateCompanionBuilder,
      $$MedicationsTableUpdateCompanionBuilder,
      (Medication, $$MedicationsTableReferences),
      Medication,
      PrefetchHooks Function({bool pregnancyId, bool visitId})
    >;
typedef $$LabResultsTableCreateCompanionBuilder =
    LabResultsCompanion Function({
      required String id,
      required String pregnancyId,
      required String title,
      required int type,
      required int testDate,
      Value<String?> textContent,
      Value<String?> imagePaths,
      Value<String?> visitId,
      Value<String?> notes,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$LabResultsTableUpdateCompanionBuilder =
    LabResultsCompanion Function({
      Value<String> id,
      Value<String> pregnancyId,
      Value<String> title,
      Value<int> type,
      Value<int> testDate,
      Value<String?> textContent,
      Value<String?> imagePaths,
      Value<String?> visitId,
      Value<String?> notes,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$LabResultsTableReferences
    extends BaseReferences<_$AppDatabase, $LabResultsTable, LabResult> {
  $$LabResultsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PregnanciesTable _pregnancyIdTable(_$AppDatabase db) =>
      db.pregnancies.createAlias(
        $_aliasNameGenerator(db.labResults.pregnancyId, db.pregnancies.id),
      );

  $$PregnanciesTableProcessedTableManager get pregnancyId {
    final $_column = $_itemColumn<String>('pregnancy_id')!;

    final manager = $$PregnanciesTableTableManager(
      $_db,
      $_db.pregnancies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pregnancyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VisitsTable _visitIdTable(_$AppDatabase db) => db.visits.createAlias(
    $_aliasNameGenerator(db.labResults.visitId, db.visits.id),
  );

  $$VisitsTableProcessedTableManager? get visitId {
    final $_column = $_itemColumn<String>('visit_id');
    if ($_column == null) return null;
    final manager = $$VisitsTableTableManager(
      $_db,
      $_db.visits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_visitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LabResultsTableFilterComposer
    extends Composer<_$AppDatabase, $LabResultsTable> {
  $$LabResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get testDate => $composableBuilder(
    column: $table.testDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePaths => $composableBuilder(
    column: $table.imagePaths,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PregnanciesTableFilterComposer get pregnancyId {
    final $$PregnanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableFilterComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitsTableFilterComposer get visitId {
    final $$VisitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableFilterComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LabResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $LabResultsTable> {
  $$LabResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get testDate => $composableBuilder(
    column: $table.testDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePaths => $composableBuilder(
    column: $table.imagePaths,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PregnanciesTableOrderingComposer get pregnancyId {
    final $$PregnanciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableOrderingComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitsTableOrderingComposer get visitId {
    final $$VisitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableOrderingComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LabResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LabResultsTable> {
  $$LabResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get testDate =>
      $composableBuilder(column: $table.testDate, builder: (column) => column);

  GeneratedColumn<String> get textContent => $composableBuilder(
    column: $table.textContent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imagePaths => $composableBuilder(
    column: $table.imagePaths,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PregnanciesTableAnnotationComposer get pregnancyId {
    final $$PregnanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitsTableAnnotationComposer get visitId {
    final $$VisitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableAnnotationComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LabResultsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LabResultsTable,
          LabResult,
          $$LabResultsTableFilterComposer,
          $$LabResultsTableOrderingComposer,
          $$LabResultsTableAnnotationComposer,
          $$LabResultsTableCreateCompanionBuilder,
          $$LabResultsTableUpdateCompanionBuilder,
          (LabResult, $$LabResultsTableReferences),
          LabResult,
          PrefetchHooks Function({bool pregnancyId, bool visitId})
        > {
  $$LabResultsTableTableManager(_$AppDatabase db, $LabResultsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LabResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LabResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LabResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pregnancyId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> type = const Value.absent(),
                Value<int> testDate = const Value.absent(),
                Value<String?> textContent = const Value.absent(),
                Value<String?> imagePaths = const Value.absent(),
                Value<String?> visitId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LabResultsCompanion(
                id: id,
                pregnancyId: pregnancyId,
                title: title,
                type: type,
                testDate: testDate,
                textContent: textContent,
                imagePaths: imagePaths,
                visitId: visitId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String pregnancyId,
                required String title,
                required int type,
                required int testDate,
                Value<String?> textContent = const Value.absent(),
                Value<String?> imagePaths = const Value.absent(),
                Value<String?> visitId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => LabResultsCompanion.insert(
                id: id,
                pregnancyId: pregnancyId,
                title: title,
                type: type,
                testDate: testDate,
                textContent: textContent,
                imagePaths: imagePaths,
                visitId: visitId,
                notes: notes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LabResultsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pregnancyId = false, visitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pregnancyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pregnancyId,
                                referencedTable: $$LabResultsTableReferences
                                    ._pregnancyIdTable(db),
                                referencedColumn: $$LabResultsTableReferences
                                    ._pregnancyIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (visitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.visitId,
                                referencedTable: $$LabResultsTableReferences
                                    ._visitIdTable(db),
                                referencedColumn: $$LabResultsTableReferences
                                    ._visitIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LabResultsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LabResultsTable,
      LabResult,
      $$LabResultsTableFilterComposer,
      $$LabResultsTableOrderingComposer,
      $$LabResultsTableAnnotationComposer,
      $$LabResultsTableCreateCompanionBuilder,
      $$LabResultsTableUpdateCompanionBuilder,
      (LabResult, $$LabResultsTableReferences),
      LabResult,
      PrefetchHooks Function({bool pregnancyId, bool visitId})
    >;
typedef $$UltrasoundImagesTableCreateCompanionBuilder =
    UltrasoundImagesCompanion Function({
      required String id,
      required String pregnancyId,
      required String imagePath,
      required int imageDate,
      Value<int?> pregnancyWeek,
      Value<String?> visitId,
      Value<String?> notes,
      Value<String?> babyMeasurements,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$UltrasoundImagesTableUpdateCompanionBuilder =
    UltrasoundImagesCompanion Function({
      Value<String> id,
      Value<String> pregnancyId,
      Value<String> imagePath,
      Value<int> imageDate,
      Value<int?> pregnancyWeek,
      Value<String?> visitId,
      Value<String?> notes,
      Value<String?> babyMeasurements,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$UltrasoundImagesTableReferences
    extends
        BaseReferences<_$AppDatabase, $UltrasoundImagesTable, UltrasoundImage> {
  $$UltrasoundImagesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PregnanciesTable _pregnancyIdTable(_$AppDatabase db) =>
      db.pregnancies.createAlias(
        $_aliasNameGenerator(
          db.ultrasoundImages.pregnancyId,
          db.pregnancies.id,
        ),
      );

  $$PregnanciesTableProcessedTableManager get pregnancyId {
    final $_column = $_itemColumn<String>('pregnancy_id')!;

    final manager = $$PregnanciesTableTableManager(
      $_db,
      $_db.pregnancies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pregnancyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VisitsTable _visitIdTable(_$AppDatabase db) => db.visits.createAlias(
    $_aliasNameGenerator(db.ultrasoundImages.visitId, db.visits.id),
  );

  $$VisitsTableProcessedTableManager? get visitId {
    final $_column = $_itemColumn<String>('visit_id');
    if ($_column == null) return null;
    final manager = $$VisitsTableTableManager(
      $_db,
      $_db.visits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_visitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UltrasoundImagesTableFilterComposer
    extends Composer<_$AppDatabase, $UltrasoundImagesTable> {
  $$UltrasoundImagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get imageDate => $composableBuilder(
    column: $table.imageDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pregnancyWeek => $composableBuilder(
    column: $table.pregnancyWeek,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get babyMeasurements => $composableBuilder(
    column: $table.babyMeasurements,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PregnanciesTableFilterComposer get pregnancyId {
    final $$PregnanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableFilterComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitsTableFilterComposer get visitId {
    final $$VisitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableFilterComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UltrasoundImagesTableOrderingComposer
    extends Composer<_$AppDatabase, $UltrasoundImagesTable> {
  $$UltrasoundImagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imagePath => $composableBuilder(
    column: $table.imagePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get imageDate => $composableBuilder(
    column: $table.imageDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pregnancyWeek => $composableBuilder(
    column: $table.pregnancyWeek,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get babyMeasurements => $composableBuilder(
    column: $table.babyMeasurements,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PregnanciesTableOrderingComposer get pregnancyId {
    final $$PregnanciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableOrderingComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitsTableOrderingComposer get visitId {
    final $$VisitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableOrderingComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UltrasoundImagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UltrasoundImagesTable> {
  $$UltrasoundImagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imagePath =>
      $composableBuilder(column: $table.imagePath, builder: (column) => column);

  GeneratedColumn<int> get imageDate =>
      $composableBuilder(column: $table.imageDate, builder: (column) => column);

  GeneratedColumn<int> get pregnancyWeek => $composableBuilder(
    column: $table.pregnancyWeek,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get babyMeasurements => $composableBuilder(
    column: $table.babyMeasurements,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PregnanciesTableAnnotationComposer get pregnancyId {
    final $$PregnanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitsTableAnnotationComposer get visitId {
    final $$VisitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.visitId,
      referencedTable: $db.visits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitsTableAnnotationComposer(
            $db: $db,
            $table: $db.visits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UltrasoundImagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UltrasoundImagesTable,
          UltrasoundImage,
          $$UltrasoundImagesTableFilterComposer,
          $$UltrasoundImagesTableOrderingComposer,
          $$UltrasoundImagesTableAnnotationComposer,
          $$UltrasoundImagesTableCreateCompanionBuilder,
          $$UltrasoundImagesTableUpdateCompanionBuilder,
          (UltrasoundImage, $$UltrasoundImagesTableReferences),
          UltrasoundImage,
          PrefetchHooks Function({bool pregnancyId, bool visitId})
        > {
  $$UltrasoundImagesTableTableManager(
    _$AppDatabase db,
    $UltrasoundImagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UltrasoundImagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UltrasoundImagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UltrasoundImagesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pregnancyId = const Value.absent(),
                Value<String> imagePath = const Value.absent(),
                Value<int> imageDate = const Value.absent(),
                Value<int?> pregnancyWeek = const Value.absent(),
                Value<String?> visitId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> babyMeasurements = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UltrasoundImagesCompanion(
                id: id,
                pregnancyId: pregnancyId,
                imagePath: imagePath,
                imageDate: imageDate,
                pregnancyWeek: pregnancyWeek,
                visitId: visitId,
                notes: notes,
                babyMeasurements: babyMeasurements,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String pregnancyId,
                required String imagePath,
                required int imageDate,
                Value<int?> pregnancyWeek = const Value.absent(),
                Value<String?> visitId = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<String?> babyMeasurements = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => UltrasoundImagesCompanion.insert(
                id: id,
                pregnancyId: pregnancyId,
                imagePath: imagePath,
                imageDate: imageDate,
                pregnancyWeek: pregnancyWeek,
                visitId: visitId,
                notes: notes,
                babyMeasurements: babyMeasurements,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UltrasoundImagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pregnancyId = false, visitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pregnancyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pregnancyId,
                                referencedTable:
                                    $$UltrasoundImagesTableReferences
                                        ._pregnancyIdTable(db),
                                referencedColumn:
                                    $$UltrasoundImagesTableReferences
                                        ._pregnancyIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (visitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.visitId,
                                referencedTable:
                                    $$UltrasoundImagesTableReferences
                                        ._visitIdTable(db),
                                referencedColumn:
                                    $$UltrasoundImagesTableReferences
                                        ._visitIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UltrasoundImagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UltrasoundImagesTable,
      UltrasoundImage,
      $$UltrasoundImagesTableFilterComposer,
      $$UltrasoundImagesTableOrderingComposer,
      $$UltrasoundImagesTableAnnotationComposer,
      $$UltrasoundImagesTableCreateCompanionBuilder,
      $$UltrasoundImagesTableUpdateCompanionBuilder,
      (UltrasoundImage, $$UltrasoundImagesTableReferences),
      UltrasoundImage,
      PrefetchHooks Function({bool pregnancyId, bool visitId})
    >;
typedef $$AppointmentsTableCreateCompanionBuilder =
    AppointmentsCompanion Function({
      required String id,
      required String pregnancyId,
      required int appointmentDate,
      Value<String?> purpose,
      Value<String?> location,
      Value<String?> doctorName,
      Value<String?> notes,
      Value<bool> reminderSet,
      Value<int?> reminderMinutesBefore,
      required int createdAt,
      required int updatedAt,
      Value<int> rowid,
    });
typedef $$AppointmentsTableUpdateCompanionBuilder =
    AppointmentsCompanion Function({
      Value<String> id,
      Value<String> pregnancyId,
      Value<int> appointmentDate,
      Value<String?> purpose,
      Value<String?> location,
      Value<String?> doctorName,
      Value<String?> notes,
      Value<bool> reminderSet,
      Value<int?> reminderMinutesBefore,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int> rowid,
    });

final class $$AppointmentsTableReferences
    extends BaseReferences<_$AppDatabase, $AppointmentsTable, Appointment> {
  $$AppointmentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PregnanciesTable _pregnancyIdTable(_$AppDatabase db) =>
      db.pregnancies.createAlias(
        $_aliasNameGenerator(db.appointments.pregnancyId, db.pregnancies.id),
      );

  $$PregnanciesTableProcessedTableManager get pregnancyId {
    final $_column = $_itemColumn<String>('pregnancy_id')!;

    final manager = $$PregnanciesTableTableManager(
      $_db,
      $_db.pregnancies,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pregnancyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AppointmentsTableFilterComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get appointmentDate => $composableBuilder(
    column: $table.appointmentDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purpose => $composableBuilder(
    column: $table.purpose,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get reminderSet => $composableBuilder(
    column: $table.reminderSet,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reminderMinutesBefore => $composableBuilder(
    column: $table.reminderMinutesBefore,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PregnanciesTableFilterComposer get pregnancyId {
    final $$PregnanciesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableFilterComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppointmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get appointmentDate => $composableBuilder(
    column: $table.appointmentDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purpose => $composableBuilder(
    column: $table.purpose,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get reminderSet => $composableBuilder(
    column: $table.reminderSet,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reminderMinutesBefore => $composableBuilder(
    column: $table.reminderMinutesBefore,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PregnanciesTableOrderingComposer get pregnancyId {
    final $$PregnanciesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableOrderingComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppointmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppointmentsTable> {
  $$AppointmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get appointmentDate => $composableBuilder(
    column: $table.appointmentDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get purpose =>
      $composableBuilder(column: $table.purpose, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get doctorName => $composableBuilder(
    column: $table.doctorName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get reminderSet => $composableBuilder(
    column: $table.reminderSet,
    builder: (column) => column,
  );

  GeneratedColumn<int> get reminderMinutesBefore => $composableBuilder(
    column: $table.reminderMinutesBefore,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PregnanciesTableAnnotationComposer get pregnancyId {
    final $$PregnanciesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.pregnancyId,
      referencedTable: $db.pregnancies,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PregnanciesTableAnnotationComposer(
            $db: $db,
            $table: $db.pregnancies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AppointmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppointmentsTable,
          Appointment,
          $$AppointmentsTableFilterComposer,
          $$AppointmentsTableOrderingComposer,
          $$AppointmentsTableAnnotationComposer,
          $$AppointmentsTableCreateCompanionBuilder,
          $$AppointmentsTableUpdateCompanionBuilder,
          (Appointment, $$AppointmentsTableReferences),
          Appointment,
          PrefetchHooks Function({bool pregnancyId})
        > {
  $$AppointmentsTableTableManager(_$AppDatabase db, $AppointmentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppointmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppointmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppointmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> pregnancyId = const Value.absent(),
                Value<int> appointmentDate = const Value.absent(),
                Value<String?> purpose = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> doctorName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> reminderSet = const Value.absent(),
                Value<int?> reminderMinutesBefore = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppointmentsCompanion(
                id: id,
                pregnancyId: pregnancyId,
                appointmentDate: appointmentDate,
                purpose: purpose,
                location: location,
                doctorName: doctorName,
                notes: notes,
                reminderSet: reminderSet,
                reminderMinutesBefore: reminderMinutesBefore,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String pregnancyId,
                required int appointmentDate,
                Value<String?> purpose = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<String?> doctorName = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<bool> reminderSet = const Value.absent(),
                Value<int?> reminderMinutesBefore = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => AppointmentsCompanion.insert(
                id: id,
                pregnancyId: pregnancyId,
                appointmentDate: appointmentDate,
                purpose: purpose,
                location: location,
                doctorName: doctorName,
                notes: notes,
                reminderSet: reminderSet,
                reminderMinutesBefore: reminderMinutesBefore,
                createdAt: createdAt,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AppointmentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pregnancyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (pregnancyId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.pregnancyId,
                                referencedTable: $$AppointmentsTableReferences
                                    ._pregnancyIdTable(db),
                                referencedColumn: $$AppointmentsTableReferences
                                    ._pregnancyIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AppointmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppointmentsTable,
      Appointment,
      $$AppointmentsTableFilterComposer,
      $$AppointmentsTableOrderingComposer,
      $$AppointmentsTableAnnotationComposer,
      $$AppointmentsTableCreateCompanionBuilder,
      $$AppointmentsTableUpdateCompanionBuilder,
      (Appointment, $$AppointmentsTableReferences),
      Appointment,
      PrefetchHooks Function({bool pregnancyId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PregnanciesTableTableManager get pregnancies =>
      $$PregnanciesTableTableManager(_db, _db.pregnancies);
  $$VisitsTableTableManager get visits =>
      $$VisitsTableTableManager(_db, _db.visits);
  $$MedicationsTableTableManager get medications =>
      $$MedicationsTableTableManager(_db, _db.medications);
  $$LabResultsTableTableManager get labResults =>
      $$LabResultsTableTableManager(_db, _db.labResults);
  $$UltrasoundImagesTableTableManager get ultrasoundImages =>
      $$UltrasoundImagesTableTableManager(_db, _db.ultrasoundImages);
  $$AppointmentsTableTableManager get appointments =>
      $$AppointmentsTableTableManager(_db, _db.appointments);
}
