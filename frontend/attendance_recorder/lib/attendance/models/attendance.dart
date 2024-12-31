import 'package:attendance_recorder/auth/models/student.dart';
import 'package:attendance_recorder/auth/models/teacher.dart';
import 'package:attendance_recorder/auth/models/class.dart';

class Attendance {
  final Student student;
  final Teacher teacher;
  final Class classInstance;
  final DateTime dateTime;
  final String status;
  Attendance({
    required this.student,
    required this.teacher,
    required this.classInstance,
    DateTime? dateTime,
    required this.status,
  }) : dateTime = dateTime ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'student': student,
      'teacher': teacher,
      'classInstance': classInstance,
      'dateTime': dateTime,
      'status': status,
    };
  }
  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      student: json['student'],
      teacher: json['teacher'],
      classInstance: json['classInstance'],
      dateTime: json['dateTime'],
      status: json['status'],
    );
  }
}