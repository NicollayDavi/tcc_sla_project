import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';

class ProjectController {
  static Future<List<dynamic>> getProjects() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/projetos'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      print("Erro ao buscar projetos: $e");
      return [];
    }
  }
}
