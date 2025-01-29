import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                height: screenHeight,
                width: screenWidth * 0.5,
                decoration: const BoxDecoration(
                  color: Color(0xFF172C10),
                ),
              ),
              Container(
                height: screenHeight,
                width: screenWidth * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            child: Container(
              height: screenHeight * 0.3,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Color(0xFF172C10),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(60),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.7,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "email",
                      prefixIcon: Icon(Icons.email),
                      border:OutlineInputBorder(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
