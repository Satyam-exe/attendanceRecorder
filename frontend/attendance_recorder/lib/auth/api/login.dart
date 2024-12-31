import 'dart:convert';

import 'package:attendance_recorder/api/api_links.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

Future<User> login(String email, String password) async {
  final response = await http.post(
    Uri.parse(loginLink),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  if (response.statusCode == 404) {
    final error = jsonDecode(response.body)['error'];
    throw Exception(error);
  }
  return User.fromJson(jsonDecode(response.body));
}