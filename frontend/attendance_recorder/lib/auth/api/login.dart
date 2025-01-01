import 'dart:convert';

import 'package:attendance_recorder/api/api_links.dart';
import 'package:attendance_recorder/auth/api/exceptions.dart';
import 'package:dart_ipify/dart_ipify.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      'ip_address': await Ipify.ipv4()
    }),
  );
  if (response.statusCode == 404) {
    throw UserDoesNotExistException();
  }
  if (response.statusCode == 401) {
    throw InvalidPasswordException();
  }
  if (response.statusCode != 200) {
    throw Exception();
  }
  User user = User.fromJson(jsonDecode(response.body));
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setBool('isLoggedIn', true);
  await sharedPreferences.setInt('id', user.id);
  await sharedPreferences.setString('fullName', user.fullName);
  await sharedPreferences.setString('role', user.role);
  return user;
}

Future<void> logout() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  final response = await http.post(
    Uri.parse(loginLink),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'user_id': sharedPreferences.getInt('id'),
      'ip_address': await Ipify.ipv4()
    }),
  );
  if (response.statusCode == 404) {
    throw UserDoesNotExistException();
  }
  if (response.statusCode != 200) {
    throw Exception();
  }
  await sharedPreferences.clear();
  await sharedPreferences.setBool('isLoggedIn', false);
}