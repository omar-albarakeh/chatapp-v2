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
      appBar: AppBar(
        backgroundColor:Colors.orange,
        title: Text("loginPage" ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),
        centerTitle: true,
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
              child: Text("Login")),
        ],
      ),
    );
  }
}
