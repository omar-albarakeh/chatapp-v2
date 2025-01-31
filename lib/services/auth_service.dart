import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  Future<void> registerUser(String name, String email, String password) async {
    final url = Uri.parse('http://127.0.0.1:8000/api/auth/register');

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

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Success: ${data['message']}');
      } else {
        print('Error: ${response.body}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
