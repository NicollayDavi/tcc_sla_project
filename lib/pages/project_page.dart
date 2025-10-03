import 'package:flutter/material.dart';
import 'package:tcc_sla_project/pages/profile_page.dart';
import 'package:tcc_sla_project/pages/home_page.dart';
import 'package:tcc_sla_project/pages/project_detail_page.dart';
import 'package:tcc_sla_project/controllers/project_controller.dart';
import 'package:tcc_sla_project/models/project_model.dart';
import 'dart:convert';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Project> projects = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    try {
      final projectList = await ProjectController.getProjects();
      setState(() {
        projects = projectList;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061143),
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
      body: Column(
        children: [
          // 🔹 Cabeçalho padronizado (sem "Olá, usuário!")
          Container(
            color: const Color(0xFF0A1C60),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProfilePage(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                Image.asset('assets/images/logo1.png', height: 60),
              ],
            ),
          ),

          const SizedBox(height: 20),
          const Text(
            'Projetos',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                : projects.isEmpty
                    ? const Center(
                        child: Text(
                          'Nenhum projeto encontrado',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    : ListView.builder(
                        itemCount: projects.length,
                        itemBuilder: (context, index) {
                          final project = projects[index];
                          return _buildProjectCard(project: project);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({required Project project}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1B55),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProjectDetailPage(
                project: project,
              ),
            ),
          );
        },
        leading: Container(
          margin: const EdgeInsets.only(right: 12),
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 70,
              height: 70,
              padding: const EdgeInsets.all(4),
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
                              size: 28,
                            ),
                          );
                        },
                      )
                    : Container(
                        color: Colors.grey.shade600,
                        child: const Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
              ),
            ),
          ),
        ),
        title: Text(
          project.nome,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.descricao.isNotEmpty)
              Text(
                project.descricao,
                style: const TextStyle(color: Colors.white70),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            Text(
              'Início: ${project.dataInicio.isNotEmpty ? project.dataInicio : 'Não informado'}',
              style: const TextStyle(color: Colors.white70),
            ),
            Text(
              'Status: ${project.status.isNotEmpty ? project.status : 'Não informado'}',
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
