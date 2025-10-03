import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../models/project_model.dart';

class ProjectController {
  static Future<List<Project>> getProjects() async {
    try {
      final response = await http.get(
        Uri.parse('${ApiConfig.baseUrl}/projeto/findAll'),
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        print('Dados recebidos da API: $jsonList');
        return jsonList.map((json) => Project.fromJson(json)).toList();
      } else {
        print('Erro na API: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print("Erro ao buscar projetos: $e");
      return [];
    }
  }
}
