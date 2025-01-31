import 'package:chatapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'Signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState(); // ✅ Fixed Class Name
}

class _LoginPageState extends State<LoginPage> { // ✅ Fixed Class Name
  bool _isPasswordVisible = false;
  bool _isHovered = false;
  bool _isLoading = false; // ✅ Added Loading State

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();

  void _login() async {
    setState(() {
      _isLoading = true; // Show loading
    });

    bool success = await authService.Login( // ✅ Fixed method name
      context,
      _emailController.text,
      _passwordController.text,
    );

    setState(() {
      _isLoading = false; // Hide loading
    });
  }

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
                    width: screenWidth * 0.4,
                  ),
                )
              ],
            ),
          ),
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
                        Text(
                          "Welcome Back!",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 15),
                        TextField(
                          controller: _passwordController,
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
                        SizedBox(height: 15),
                        Container(
                          width: 300,
                          height: 50,
                          child: MouseRegion(
                            onEnter: (_) {
                              setState(() {
                                _isHovered = true;
                              });
                            },
                            onExit: (_) {
                              setState(() {
                                _isHovered = false;
                              });
                            },
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _login, // ✅ Disable when loading
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(
                                    _isHovered ? Colors.greenAccent : Colors.green),
                              ),
                              child: _isLoading
                                  ? CircularProgressIndicator(color: Colors.white) // ✅ Show loader
                                  : Text(
                                "Login",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignupPage()));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an Account?"),
                              Text(
                                "Signup ",
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                        )
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
