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
              child: Stack(
                children: [
                  Container(
                    height: screenHeight * 0.35,
                    width: screenWidth,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/Auth_image.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.35,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Color(0xFF172C10).withOpacity(0.8),
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                  ),
                  Center(
                      child: Image.asset(
                        'lib/assets/Logo.png',
                        height: screenHeight * 0.4,
                        width: screenWidth*0.4,
                      ),
                  )
                ],
              )),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.65,
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
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text("Welcome Back!",style: TextStyle(color: Colors.black,fontSize: 30),),
                        SizedBox(height: 30,),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          obscureText: !_isConfirmPasswordVisible,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                                });
                              },
                              icon: Icon(
                                _isConfirmPasswordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 300,
                          height: 50,
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                // Change the button's color when hovered
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                // Reset the button's color when the hover ends
                              });
                            },
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                      (states) {
                                    if (states.contains(MaterialState.hovered)) {
                                      return Colors.greenAccent; // Hover color
                                    }
                                    return Colors.green; // Default color
                                  },
                                ),
                              ),
                              child: Text("SignUp",style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text("have and account ? LOGIN"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
