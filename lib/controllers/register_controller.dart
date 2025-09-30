import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterController {
  static const String _baseUrl = 'http://localhost:8080';

  static Future<bool> register(String nome, String email, String senha, String rm) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/usuario/save'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nome': nome,
          'email': email,
          'senha': senha,
          'rm': rm,
        }),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}