import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Hello Signup", style: TextStyle(fontSize: 40)),
              Icon(Icons.handshake, size: 40),
            ],
          ),
          SizedBox(height: 30,),
          TextField(
            decoration: InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
          ),
              SizedBox(height: 15,),
              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
        ]));
  }
}
