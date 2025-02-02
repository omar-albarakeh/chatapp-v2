import 'dart:convert';
import 'package:chatapp/Auth/loginpage.dart';
import 'package:chatapp/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'http://192.168.0.102:8000/api/auth';

  Future<bool> registerUser(BuildContext context, String name, String email, String password) async {
    final url = Uri.parse('$baseUrl/register');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User registration successful!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
        return true;
      } else {
        _showError(context, "Registration failed: ${response.body}");
        return false;
      }
    } catch (e) {
      _showError(context, "Exception: $e");
      return false;
    }
  }

  Future<bool> login(BuildContext context, String email, String password) async {
    final url = Uri.parse('$baseUrl/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final String token = responseData['token'];

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        final savedToken = prefs.getString('token');
        debugPrint("✅ Token Successfully Saved: $savedToken");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Login successful!")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homescreen()),
        );
        return true;
      } else {
        _showError(context, "Login failed: ${response.body}");
        return false;
      }
    } catch (e) {
      _showError(context, "Exception: $e");
      return false;
    }
  }


  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    debugPrint("🔍 Retrieved Token: $token");
    return token;
  }

  Future<void> logout(BuildContext context) async {
    final url = Uri.parse('$baseUrl/logout');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      _showError(context, "No token found. Already logged out?");
      return;
    }

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        await prefs.remove('token');
        debugPrint("✅ Token removed, user logged out.");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Logged out successfully!")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        _showError(context, "Logout failed: ${response.body}");
      }
    } catch (e) {
      _showError(context, "Exception: $e");
    }
  }

  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
