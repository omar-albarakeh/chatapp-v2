import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.orange,
        title: Text("loginPage" ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
        centerTitle: true,
      ),
    );
  }
}
