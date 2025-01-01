// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RecordAttendanceTableTable extends RecordAttendanceTable
    with TableInfo<$RecordAttendanceTableTable, RecordAttendanceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecordAttendanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _studentAdmnNumberMeta =
      const VerificationMeta('studentAdmnNumber');
  @override
  late final GeneratedColumn<int> studentAdmnNumber = GeneratedColumn<int>(
      'student_admn_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _teacherIdMeta =
      const VerificationMeta('teacherId');
  @override
  late final GeneratedColumn<int> teacherId = GeneratedColumn<int>(
      'teacher_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _classInstanceIdMeta =
      const VerificationMeta('classInstanceId');
  @override
  late final GeneratedColumn<int> classInstanceId = GeneratedColumn<int>(
      'class_instance_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dateTimeClientMeta =
      const VerificationMeta('dateTimeClient');
  @override
  late final GeneratedColumn<DateTime> dateTimeClient =
      GeneratedColumn<DateTime>('date_time_client', aliasedName, false,
          type: DriftSqlType.dateTime,
          requiredDuringInsert: false,
          clientDefault: () => DateTime.now());
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _syncedToBackendMeta =
      const VerificationMeta('syncedToBackend');
  @override
  late final GeneratedColumn<bool> syncedToBackend = GeneratedColumn<bool>(
      'synced_to_backend', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("synced_to_backend" IN (0, 1))'),
      clientDefault: () => false);
  @override
  List<GeneratedColumn> get $columns => [
        studentAdmnNumber,
        teacherId,
        classInstanceId,
        dateTimeClient,
        status,
        syncedToBackend
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'record_attendance_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecordAttendanceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('student_admn_number')) {
      context.handle(
          _studentAdmnNumberMeta,
          studentAdmnNumber.isAcceptableOrUnknown(
              data['student_admn_number']!, _studentAdmnNumberMeta));
    } else if (isInserting) {
      context.missing(_studentAdmnNumberMeta);
    }
    if (data.containsKey('teacher_id')) {
      context.handle(_teacherIdMeta,
          teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta));
    } else if (isInserting) {
      context.missing(_teacherIdMeta);
    }
    if (data.containsKey('class_instance_id')) {
      context.handle(
          _classInstanceIdMeta,
          classInstanceId.isAcceptableOrUnknown(
              data['class_instance_id']!, _classInstanceIdMeta));
    } else if (isInserting) {
      context.missing(_classInstanceIdMeta);
    }
    if (data.containsKey('date_time_client')) {
      context.handle(
          _dateTimeClientMeta,
          dateTimeClient.isAcceptableOrUnknown(
              data['date_time_client']!, _dateTimeClientMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('synced_to_backend')) {
      context.handle(
          _syncedToBackendMeta,
          syncedToBackend.isAcceptableOrUnknown(
              data['synced_to_backend']!, _syncedToBackendMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  RecordAttendanceTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecordAttendanceTableData(
      studentAdmnNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}student_admn_number'])!,
      teacherId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}teacher_id'])!,
      classInstanceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}class_instance_id'])!,
      dateTimeClient: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_time_client'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      syncedToBackend: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}synced_to_backend'])!,
    );
  }

  @override
  $RecordAttendanceTableTable createAlias(String alias) {
    return $RecordAttendanceTableTable(attachedDatabase, alias);
  }
}

class RecordAttendanceTableData extends DataClass
    implements Insertable<RecordAttendanceTableData> {
  final int studentAdmnNumber;
  final int teacherId;
  final int classInstanceId;
  final DateTime dateTimeClient;
  final String status;
  final bool syncedToBackend;
  const RecordAttendanceTableData(
      {required this.studentAdmnNumber,
      required this.teacherId,
      required this.classInstanceId,
      required this.dateTimeClient,
      required this.status,
      required this.syncedToBackend});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['student_admn_number'] = Variable<int>(studentAdmnNumber);
    map['teacher_id'] = Variable<int>(teacherId);
    map['class_instance_id'] = Variable<int>(classInstanceId);
    map['date_time_client'] = Variable<DateTime>(dateTimeClient);
    map['status'] = Variable<String>(status);
    map['synced_to_backend'] = Variable<bool>(syncedToBackend);
    return map;
  }

  RecordAttendanceTableCompanion toCompanion(bool nullToAbsent) {
    return RecordAttendanceTableCompanion(
      studentAdmnNumber: Value(studentAdmnNumber),
      teacherId: Value(teacherId),
      classInstanceId: Value(classInstanceId),
      dateTimeClient: Value(dateTimeClient),
      status: Value(status),
      syncedToBackend: Value(syncedToBackend),
    );
  }

  factory RecordAttendanceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecordAttendanceTableData(
      studentAdmnNumber: serializer.fromJson<int>(json['studentAdmnNumber']),
      teacherId: serializer.fromJson<int>(json['teacherId']),
      classInstanceId: serializer.fromJson<int>(json['classInstanceId']),
      dateTimeClient: serializer.fromJson<DateTime>(json['dateTimeClient']),
      status: serializer.fromJson<String>(json['status']),
      syncedToBackend: serializer.fromJson<bool>(json['syncedToBackend']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'studentAdmnNumber': serializer.toJson<int>(studentAdmnNumber),
      'teacherId': serializer.toJson<int>(teacherId),
      'classInstanceId': serializer.toJson<int>(classInstanceId),
      'dateTimeClient': serializer.toJson<DateTime>(dateTimeClient),
      'status': serializer.toJson<String>(status),
      'syncedToBackend': serializer.toJson<bool>(syncedToBackend),
    };
  }

  RecordAttendanceTableData copyWith(
          {int? studentAdmnNumber,
          int? teacherId,
          int? classInstanceId,
          DateTime? dateTimeClient,
          String? status,
          bool? syncedToBackend}) =>
      RecordAttendanceTableData(
        studentAdmnNumber: studentAdmnNumber ?? this.studentAdmnNumber,
        teacherId: teacherId ?? this.teacherId,
        classInstanceId: classInstanceId ?? this.classInstanceId,
        dateTimeClient: dateTimeClient ?? this.dateTimeClient,
        status: status ?? this.status,
        syncedToBackend: syncedToBackend ?? this.syncedToBackend,
      );
  RecordAttendanceTableData copyWithCompanion(
      RecordAttendanceTableCompanion data) {
    return RecordAttendanceTableData(
      studentAdmnNumber: data.studentAdmnNumber.present
          ? data.studentAdmnNumber.value
          : this.studentAdmnNumber,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      classInstanceId: data.classInstanceId.present
          ? data.classInstanceId.value
          : this.classInstanceId,
      dateTimeClient: data.dateTimeClient.present
          ? data.dateTimeClient.value
          : this.dateTimeClient,
      status: data.status.present ? data.status.value : this.status,
      syncedToBackend: data.syncedToBackend.present
          ? data.syncedToBackend.value
          : this.syncedToBackend,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecordAttendanceTableData(')
          ..write('studentAdmnNumber: $studentAdmnNumber, ')
          ..write('teacherId: $teacherId, ')
          ..write('classInstanceId: $classInstanceId, ')
          ..write('dateTimeClient: $dateTimeClient, ')
          ..write('status: $status, ')
          ..write('syncedToBackend: $syncedToBackend')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(studentAdmnNumber, teacherId, classInstanceId,
      dateTimeClient, status, syncedToBackend);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecordAttendanceTableData &&
          other.studentAdmnNumber == this.studentAdmnNumber &&
          other.teacherId == this.teacherId &&
          other.classInstanceId == this.classInstanceId &&
          other.dateTimeClient == this.dateTimeClient &&
          other.status == this.status &&
          other.syncedToBackend == this.syncedToBackend);
}

class RecordAttendanceTableCompanion
    extends UpdateCompanion<RecordAttendanceTableData> {
  final Value<int> studentAdmnNumber;
  final Value<int> teacherId;
  final Value<int> classInstanceId;
  final Value<DateTime> dateTimeClient;
  final Value<String> status;
  final Value<bool> syncedToBackend;
  final Value<int> rowid;
  const RecordAttendanceTableCompanion({
    this.studentAdmnNumber = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.classInstanceId = const Value.absent(),
    this.dateTimeClient = const Value.absent(),
    this.status = const Value.absent(),
    this.syncedToBackend = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecordAttendanceTableCompanion.insert({
    required int studentAdmnNumber,
    required int teacherId,
    required int classInstanceId,
    this.dateTimeClient = const Value.absent(),
    required String status,
    this.syncedToBackend = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : studentAdmnNumber = Value(studentAdmnNumber),
        teacherId = Value(teacherId),
        classInstanceId = Value(classInstanceId),
        status = Value(status);
  static Insertable<RecordAttendanceTableData> custom({
    Expression<int>? studentAdmnNumber,
    Expression<int>? teacherId,
    Expression<int>? classInstanceId,
    Expression<DateTime>? dateTimeClient,
    Expression<String>? status,
    Expression<bool>? syncedToBackend,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (studentAdmnNumber != null) 'student_admn_number': studentAdmnNumber,
      if (teacherId != null) 'teacher_id': teacherId,
      if (classInstanceId != null) 'class_instance_id': classInstanceId,
      if (dateTimeClient != null) 'date_time_client': dateTimeClient,
      if (status != null) 'status': status,
      if (syncedToBackend != null) 'synced_to_backend': syncedToBackend,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecordAttendanceTableCompanion copyWith(
      {Value<int>? studentAdmnNumber,
      Value<int>? teacherId,
      Value<int>? classInstanceId,
      Value<DateTime>? dateTimeClient,
      Value<String>? status,
      Value<bool>? syncedToBackend,
      Value<int>? rowid}) {
    return RecordAttendanceTableCompanion(
      studentAdmnNumber: studentAdmnNumber ?? this.studentAdmnNumber,
      teacherId: teacherId ?? this.teacherId,
      classInstanceId: classInstanceId ?? this.classInstanceId,
      dateTimeClient: dateTimeClient ?? this.dateTimeClient,
      status: status ?? this.status,
      syncedToBackend: syncedToBackend ?? this.syncedToBackend,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (studentAdmnNumber.present) {
      map['student_admn_number'] = Variable<int>(studentAdmnNumber.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<int>(teacherId.value);
    }
    if (classInstanceId.present) {
      map['class_instance_id'] = Variable<int>(classInstanceId.value);
    }
    if (dateTimeClient.present) {
      map['date_time_client'] = Variable<DateTime>(dateTimeClient.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (syncedToBackend.present) {
      map['synced_to_backend'] = Variable<bool>(syncedToBackend.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecordAttendanceTableCompanion(')
          ..write('studentAdmnNumber: $studentAdmnNumber, ')
          ..write('teacherId: $teacherId, ')
          ..write('classInstanceId: $classInstanceId, ')
          ..write('dateTimeClient: $dateTimeClient, ')
          ..write('status: $status, ')
          ..write('syncedToBackend: $syncedToBackend, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RecordAttendanceTableTable recordAttendanceTable =
      $RecordAttendanceTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recordAttendanceTable];
}

typedef $$RecordAttendanceTableTableCreateCompanionBuilder
    = RecordAttendanceTableCompanion Function({
  required int studentAdmnNumber,
  required int teacherId,
  required int classInstanceId,
  Value<DateTime> dateTimeClient,
  required String status,
  Value<bool> syncedToBackend,
  Value<int> rowid,
});
typedef $$RecordAttendanceTableTableUpdateCompanionBuilder
    = RecordAttendanceTableCompanion Function({
  Value<int> studentAdmnNumber,
  Value<int> teacherId,
  Value<int> classInstanceId,
  Value<DateTime> dateTimeClient,
  Value<String> status,
  Value<bool> syncedToBackend,
  Value<int> rowid,
});

class $$RecordAttendanceTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecordAttendanceTableTable> {
  $$RecordAttendanceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get studentAdmnNumber => $composableBuilder(
      column: $table.studentAdmnNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get teacherId => $composableBuilder(
      column: $table.teacherId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get classInstanceId => $composableBuilder(
      column: $table.classInstanceId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateTimeClient => $composableBuilder(
      column: $table.dateTimeClient,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get syncedToBackend => $composableBuilder(
      column: $table.syncedToBackend,
      builder: (column) => ColumnFilters(column));
}

class $$RecordAttendanceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecordAttendanceTableTable> {
  $$RecordAttendanceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get studentAdmnNumber => $composableBuilder(
      column: $table.studentAdmnNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get teacherId => $composableBuilder(
      column: $table.teacherId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get classInstanceId => $composableBuilder(
      column: $table.classInstanceId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateTimeClient => $composableBuilder(
      column: $table.dateTimeClient,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get syncedToBackend => $composableBuilder(
      column: $table.syncedToBackend,
      builder: (column) => ColumnOrderings(column));
}

class $$RecordAttendanceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecordAttendanceTableTable> {
  $$RecordAttendanceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get studentAdmnNumber => $composableBuilder(
      column: $table.studentAdmnNumber, builder: (column) => column);

  GeneratedColumn<int> get teacherId =>
      $composableBuilder(column: $table.teacherId, builder: (column) => column);

  GeneratedColumn<int> get classInstanceId => $composableBuilder(
      column: $table.classInstanceId, builder: (column) => column);

  GeneratedColumn<DateTime> get dateTimeClient => $composableBuilder(
      column: $table.dateTimeClient, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get syncedToBackend => $composableBuilder(
      column: $table.syncedToBackend, builder: (column) => column);
}

class $$RecordAttendanceTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecordAttendanceTableTable,
    RecordAttendanceTableData,
    $$RecordAttendanceTableTableFilterComposer,
    $$RecordAttendanceTableTableOrderingComposer,
    $$RecordAttendanceTableTableAnnotationComposer,
    $$RecordAttendanceTableTableCreateCompanionBuilder,
    $$RecordAttendanceTableTableUpdateCompanionBuilder,
    (
      RecordAttendanceTableData,
      BaseReferences<_$AppDatabase, $RecordAttendanceTableTable,
          RecordAttendanceTableData>
    ),
    RecordAttendanceTableData,
    PrefetchHooks Function()> {
  $$RecordAttendanceTableTableTableManager(
      _$AppDatabase db, $RecordAttendanceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecordAttendanceTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$RecordAttendanceTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecordAttendanceTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> studentAdmnNumber = const Value.absent(),
            Value<int> teacherId = const Value.absent(),
            Value<int> classInstanceId = const Value.absent(),
            Value<DateTime> dateTimeClient = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<bool> syncedToBackend = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecordAttendanceTableCompanion(
            studentAdmnNumber: studentAdmnNumber,
            teacherId: teacherId,
            classInstanceId: classInstanceId,
            dateTimeClient: dateTimeClient,
            status: status,
            syncedToBackend: syncedToBackend,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int studentAdmnNumber,
            required int teacherId,
            required int classInstanceId,
            Value<DateTime> dateTimeClient = const Value.absent(),
            required String status,
            Value<bool> syncedToBackend = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecordAttendanceTableCompanion.insert(
            studentAdmnNumber: studentAdmnNumber,
            teacherId: teacherId,
            classInstanceId: classInstanceId,
            dateTimeClient: dateTimeClient,
            status: status,
            syncedToBackend: syncedToBackend,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecordAttendanceTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $RecordAttendanceTableTable,
        RecordAttendanceTableData,
        $$RecordAttendanceTableTableFilterComposer,
        $$RecordAttendanceTableTableOrderingComposer,
        $$RecordAttendanceTableTableAnnotationComposer,
        $$RecordAttendanceTableTableCreateCompanionBuilder,
        $$RecordAttendanceTableTableUpdateCompanionBuilder,
        (
          RecordAttendanceTableData,
          BaseReferences<_$AppDatabase, $RecordAttendanceTableTable,
              RecordAttendanceTableData>
        ),
        RecordAttendanceTableData,
        PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RecordAttendanceTableTableTableManager get recordAttendanceTable =>
      $$RecordAttendanceTableTableTableManager(_db, _db.recordAttendanceTable);
}
