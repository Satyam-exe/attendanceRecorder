import 'dart:io';

import 'package:attendance_recorder/auth/api/exceptions.dart';
import 'package:attendance_recorder/auth/api/login.dart';
import 'package:attendance_recorder/auth/forms/validators.dart';
import 'package:attendance_recorder/auth/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  bool isLoading = false;
  String? emailError;
  String? passwordError;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/sdss_bg.jpeg',
              fit: BoxFit.cover, // Ensures the image covers the screen
              opacity: AlwaysStoppedAnimation<double>(0.2),
            ),
          ),
          // Foreground content
          SizedBox(
            height: MediaQuery.of(context)
                .size
                .height, // Ensures full height coverage
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                  child: Image(
                    image: AssetImage('assets/images/sdss_logo.png'),
                    opacity: AlwaysStoppedAnimation<double>(1),
                    width: 200,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.school_rounded),
                            labelText: "Email ID",
                            errorText: emailError,
                            errorMaxLines: 2,
                          ),
                          validator: (value) => emailFieldValidator(value),
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: !passwordVisible,
                          decoration: InputDecoration(
                            icon: Icon(Icons.password_rounded),
                            labelText: "Password",
                            errorText: passwordError,
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) => passwordFieldValidator(value),
                        ),
                        const SizedBox(height: 20),
                        isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.grey,
                                  fixedSize: Size(120, 30),
                                  textStyle: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: GoogleFonts.kanit().fontFamily,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () async {
                                  setState(() {
                                    emailError = null;
                                    passwordError = null;
                                  });
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    final email = emailController.text;
                                    final password = passwordController.text;

                                    try {
                                      await login(email, password);
                                      SharedPreferences sharedPreferences =
                                          await SharedPreferences.getInstance();
                                      if (sharedPreferences
                                              .getBool('isLoggedIn') ==
                                          true) {
                                        if (!context.mounted) return;
                                        Navigator.of(context)
                                            .pushReplacementNamed('/home');
                                      }
                                    } catch (e) {
                                      if (e is UserDoesNotExistException) {
                                        setState(() {
                                          emailError = "User does not exist.";
                                        });
                                      } else if (e
                                          is InvalidPasswordException) {
                                        setState(() {
                                          passwordError = "Invalid password.";
                                        });
                                      } else {
                                        const snackBar = SnackBar(
                                            content:
                                                Text("Something went wrong!"));
                                        if (!context.mounted) return;
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      }
                                    } finally {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  }
                                },
                                child: const Text('Login'),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
