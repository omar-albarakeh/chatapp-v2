import 'package:chatapp/Auth/Signup.dart';
import 'package:flutter/material.dart';
import 'Auth/loginpage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SignupPage(),
    );
  }
}