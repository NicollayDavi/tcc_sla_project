import 'package:flutter/material.dart';
import 'package:tcc_sla_project/pages/home_page.dart';
import 'package:tcc_sla_project/models/project_model.dart';
import 'dart:convert';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061143),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1C60),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          project.nome,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Informações
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF0A1B55),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 100,
                        height: 100,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: project.imagem != null && project.imagem!.isNotEmpty
                              ? Image.memory(
                                  base64Decode(project.imagem!),
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey.shade600,
                                      child: const Icon(
                                        Icons.image_not_supported,
                                        color: Colors.white,
                                        size: 36,
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  color: Colors.grey.shade600,
                                  child: const Icon(
                                    Icons.image,
                                    color: Colors.white,
                                    size: 36,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Informações",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Status: ${project.status.isNotEmpty ? project.status : 'Não informado'}",
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "Início: ${project.dataInicio.isNotEmpty ? project.dataInicio : 'Não informado'}",
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "Fim: ${project.dataFim.isNotEmpty ? project.dataFim : 'Não informado'}",
                          style: const TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Descrição
            const Text(
              "Descrição",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              project.descricao.isNotEmpty ? project.descricao : 'Descrição não informada',
              style: const TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 20),

            // Integrantes
            const Text(
              "Integrantes",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),

            _buildMember("Nicolay Davi"),
            _buildMember("Lucas Fernandes"),
            _buildMember("Mateus Zabot"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        backgroundColor: const Color(0xFF1C2F70),
        child: const Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1C2F70),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: const SizedBox(height: 56),
      ),
    );
  }

  Widget _buildMember(String name) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyanAccent),
        borderRadius: BorderRadius.circular(12),
        color: const Color(0xFF0A1B55),
      ),
      child: Row(
        children: [
          const Icon(Icons.person, color: Colors.white),
          const SizedBox(width: 10),
          Text(name, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
