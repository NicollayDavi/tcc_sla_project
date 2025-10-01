import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class LoginController {
  static Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/usuario/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'senha': password,
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print("Erro ao logar: $e");
      return false;
    }
  }
}
