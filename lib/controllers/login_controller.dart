import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController {
  static const String _baseUrl = 'http://localhost:8080';

  static Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/usuario/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'senha': password,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}