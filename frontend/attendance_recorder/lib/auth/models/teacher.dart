import 'package:attendance_recorder/auth/models/user.dart';

class Teacher {
  final User user;
  final String subject;
  Teacher({
    required this.user,
    required this.subject,
  });

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'subject': subject,
    };
  }
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      user: json['user'],
      subject: json['subject'],
    );
  }
}