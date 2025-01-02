import 'package:attendance_recorder/auth/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'db/database.dart';

void main() {
  runApp(
    Provider<AppDatabase>(
      create: (context) => AppDatabase(),
      child: AttendanceRecorderApp(),
      dispose: (context, db) => db.close(),
    ),
  );
}

class AttendanceRecorderApp extends StatelessWidget {
  const AttendanceRecorderApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CheckLoginPage(),
        '/login': (context) => const LoginView()
      },
    );
  }
}

class CheckLoginPage extends StatelessWidget {
  const CheckLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkIfLoggedIn(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const CircularProgressIndicator.adaptive();
          default:
            if (snapshot.hasError) {
              return const Text(
                  'An error occurred'); // Handle errors gracefully
            } else {
              switch (snapshot.data) {
                case true:
                  return const Text('Logged In');
                default:
                  // Navigate and return a placeholder widget
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacementNamed(context, '/login');
                  });
                  return const SizedBox(); // Placeholder widget
              }
            }
        }
      },
    );
  }

  Future<bool> checkIfLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('isLoggedIn') ?? false;
  }
}
