import 'package:chatapp/services/auth_service.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String? token;

  Future<void> logout() async {
    final AuthService authService = AuthService();
    await authService.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
