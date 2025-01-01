import 'dart:convert';

import 'package:attendance_recorder/api/api_links.dart';
import 'package:attendance_recorder/db/database.dart';
import 'package:attendance_recorder/db/exceptions.dart';
import 'package:http/http.dart' as http;

class AttendanceRepository{

  final AppDatabase db;

  AttendanceRepository(this.db);


  logAttendanceToOfflineDb({required List<Map<String, dynamic>> listOfStudents}) async {
    final database = AppDatabase();
    
    for (final student in listOfStudents) {
      await database.into(database.recordAttendanceTable).insert(RecordAttendanceTableCompanion.insert(
        studentAdmnNumber: student['studentAdmnNumber'], 
        teacherId: student['teacherId'], 
        classInstanceId: student['classInstanceId'], 
        status: student['status'],
        ));
    }
  }

  Future<bool> checkIfSynced() async {
    final unsyncedRows = await (db.select(db.recordAttendanceTable)..where((row) => row.syncedToBackend.equals(false))).get();
    if (unsyncedRows.isEmpty) return true;
    return false;
  }

  Future<List<RecordAttendanceTableData>> getUnsyncedAttendance() async {
    final unsyncedRows = await (db.select(db.recordAttendanceTable)..where((row) => row.syncedToBackend.equals(false))).get();
    return unsyncedRows;
  }

  Future sendAttendanceToBackend() async {

    final unsyncedAttendance = await getUnsyncedAttendance();

    final List<Map<String, dynamic>> jsonBody = [];

    for (final attendanceInstance in unsyncedAttendance) {
      jsonBody.add({
        'student_admn_number': attendanceInstance.studentAdmnNumber,
        'teacher_id': attendanceInstance.teacherId,
        'class_instance_id': attendanceInstance.classInstanceId,
        'date_time_client': attendanceInstance.dateTimeClient.toString(),
        'status': attendanceInstance.status,
    });
    }

    try {
      final response = await http.post(
        Uri.parse(addAttendanceLink),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(jsonBody)
      );
      if (response.statusCode == 400) {
      throw InvalidAttendanceDataToBackendException();
    }
    }
    catch (e) {
      throw Exception(e);
    }
  }
}