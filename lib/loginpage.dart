import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Welcome Back " ,style: TextStyle(fontSize: 40),),
          SizedBox(height: 30),
          const TextField(
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              labelText: "password",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              suffixIcon: IconButton(
                icon : Icon(_visible ? Icons.visibility_off: Icons.visibility),
                onPressed :(){
                  setState(
                      (){
                        _visible= !_visible;});
                      },
              ),
            ),
            obscureText: _visible,
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300,50),
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            child: const Text("LOGIN"),
          ),
        ],
      ),
    );
  }
}
