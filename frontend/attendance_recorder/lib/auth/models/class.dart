import 'package:attendance_recorder/auth/models/teacher.dart';

class Class {
  final int grade;
  final String section;
  final Teacher? classTeacher;
  final List<Teacher>? subjectTeachers;

  Class({
    required this.grade,
    required this.section,
    this.classTeacher,
    this.subjectTeachers,
  });

  Map<String, dynamic> toJson() {
    return {
      'grade': grade,
      'section': section,
      'classTeacher': classTeacher,
      'subjectTeachers': subjectTeachers,
    };
  }
  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      grade: json['grade'],
      section: json['section'],
      classTeacher: json['classTeacher'],
      subjectTeachers: json['subjectTeachers'],
    );
  }
}