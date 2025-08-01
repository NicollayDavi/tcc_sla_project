import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061143), // fundo azul escuro
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF061143),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Topo com saudação
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: Color(0xFF061143)),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá, usuário!',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Seja bem-vindo (a)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/logo.png', // substitua pelo caminho correto da logo
                    height: 40,
                  ),
                ],
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
                child: ListView(
                  children: [
                    _buildProjectCard(
                      context,
                      title: 'IGUALDADE DE GÊNERO',
                      date: '02/07/2024',
                      hour: '08:00 até 15:00',
                      room: 'Sala: 14',
                      borderColor: Colors.transparent,
                      iconColor: Colors.white,
                    ),
                    _buildProjectCard(
                      context,
                      title: 'TEA - TRANSTORNO DO ESPECTRO AUTISTA',
                      date: '02/07/2024',
                      hour: '10:00 até 16:00',
                      room: 'Sala: 14',
                      borderColor: Colors.green,
                      iconColor: Colors.green,
                    ),
                    _buildProjectCard(
                      context,
                      title: 'RACISMO É CRIME!',
                      date: '02/07/2024',
                      hour: '08:00 até 13:00',
                      room: 'Sala: 15',
                      borderColor: Colors.transparent,
                      iconColor: Colors.white,
                    ),
                    _buildProjectCard(
                      context,
                      title: 'FAKE NEWS!',
                      date: '02/07/2024',
                      hour: '12:00 até 15:30',
                      room: 'Sala: 17',
                      borderColor: Colors.transparent,
                      iconColor: Colors.white,
                    ),
                    _buildProjectCard(
                      context,
                      title: 'Mulheres têm sua liberdade',
                      date: '02/07/2024',
                      hour: '13:00 até 16:00',
                      room: 'Sala: 30',
                      borderColor: Colors.pink,
                      iconColor: Colors.pink,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(
    BuildContext context, {
    required String title,
    required String date,
    required String hour,
    required String room,
    required Color borderColor,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2),
        color: const Color(0xFF0A1B55),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.image, color: Colors.white), // Imagem do projeto (placeholder)
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dia: $date', style: const TextStyle(color: Colors.white70)),
            Text('Horários: Das $hour', style: const TextStyle(color: Colors.white70)),
            Text(room, style: const TextStyle(color: Colors.white70)),
          ],
        ),
        trailing: Column(
          children: [
            Icon(Icons.close, color: iconColor),
            const SizedBox(height: 10),
            Icon(Icons.favorite_border, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
