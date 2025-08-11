import 'package:flutter/material.dart';
import 'package:tcc_sla_project/pages/profile_page.dart';
import 'package:tcc_sla_project/pages/home_page.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Map<String, dynamic>> projects = [
    {
      'title': 'IGUALDADE DE GÊNERO',
      'date': '02/07/2024',
      'hour': '08:00 até 15:00',
      'room': 'Sala: 14',
      'favorite': false,
    },
  ];

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
          Container(
            color: const Color(0xFF0A1C60),
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá, usuário!",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Seja bem-vindo (a)",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
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
            child: ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return _buildProjectCard(
                  title: project['title'],
                  date: project['date'],
                  hour: project['hour'],
                  room: project['room'],
                  isFavorite: project['favorite'],
                  onDelete: () {
                    setState(() {
                      projects.removeAt(index);
                    });
                  },
                  onFavoriteToggle: () {
                    setState(() {
                      projects[index]['favorite'] = !project['favorite'];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required String title,
    required String date,
    required String hour,
    required String room,
    required bool isFavorite,
    required VoidCallback onDelete,
    required VoidCallback onFavoriteToggle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0A1B55),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/logo3.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dia: $date', style: const TextStyle(color: Colors.white70)),
            Text(
              'Horários: Das $hour',
              style: const TextStyle(color: Colors.white70),
            ),
            Text(room, style: const TextStyle(color: Colors.white70)),
          ],
        ),
        trailing: SizedBox(
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: onDelete,
                tooltip: 'Excluir projeto',
              ),
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
                onPressed: onFavoriteToggle,
                tooltip: 'Favoritar',
              ),
            ],
          ),
        ),
      ), // FECHA ListTile
    ); // FECHA Container <--- ESSA É A QUE FALTAVA
  }
}
