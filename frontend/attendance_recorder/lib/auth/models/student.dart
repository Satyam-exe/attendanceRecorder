import 'package:attendance_recorder/api/api_links.dart';
import 'package:attendance_recorder/auth/models/user.dart';

import 'class.dart';

class Student {
  final User user;
  final int admnNumber;
  final Class? enrolledClass;

  Student({
    required this.user,
    required this.admnNumber,
    this.enrolledClass
  });

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'admnNumber': admnNumber,
      'enrolledClass': enrolledClass,
    };
  }
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      user: json['user'],
      admnNumber: json['admnNumber'],
      enrolledClass: json['enrolledClass'],
    );
  }
}