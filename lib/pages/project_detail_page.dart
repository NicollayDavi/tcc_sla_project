import 'package:flutter/material.dart';
import 'package:tcc_sla_project/pages/home_page.dart';

class ProjectDetailPage extends StatelessWidget {
  final String title;
  final String date;
  final String hour;
  final String room;

  const ProjectDetailPage({
    super.key,
    required this.title,
    required this.date,
    required this.hour,
    required this.room,
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
          title,
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/logo3.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
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
                          "Sala: $room",
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "Dia: $date",
                          style: const TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "Horários: Das $hour",
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
            const Text(
              "O projeto busca promover a conscientização sobre a importância da igualdade de gênero por meio de debates, dinâmicas e exposição de ideias. Durante a apresentação, serão discutidos estereótipos de gênero, desigualdades no mercado de trabalho, representação política e na mídia, além de estratégias para combater o machismo e a discriminação. O público será convidado a participar ativamente, compartilhando ideias e experiências para que, juntos, possamos construir pontes de respeito e equidade.",
              style: TextStyle(color: Colors.white70, fontSize: 14),
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
