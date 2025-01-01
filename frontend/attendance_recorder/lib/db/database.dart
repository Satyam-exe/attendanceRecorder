import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

class RecordAttendanceTable extends Table {
  IntColumn get studentAdmnNumber => integer()();
  IntColumn get teacherId => integer()();
  IntColumn get classInstanceId => integer()();
  DateTimeColumn get dateTimeClient => dateTime().clientDefault(() => DateTime.now())();
  TextColumn get status => text()();
  BoolColumn get syncedToBackend => boolean().clientDefault(() => false)();
}

@DriftDatabase(tables: [RecordAttendanceTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(): super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name:"attendance_db");
  }
}