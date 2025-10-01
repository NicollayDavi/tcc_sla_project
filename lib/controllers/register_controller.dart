import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class RegisterController {
  static Future<bool> register(String nome, String email, String senha, String rm) async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/usuario/save'),
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
      print("Erro ao registrar: $e");
      return false;
    }
  }
}
