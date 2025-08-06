import 'package:flutter/material.dart';
import 'package:tcc_sla_project/pages/profile_page.dart';
// Importe suas páginas abaixo
import 'package:tcc_sla_project/pages/map_page.dart';
import 'package:tcc_sla_project/pages/date_page.dart';
import 'package:tcc_sla_project/pages/project_page.dart';
import 'package:tcc_sla_project/pages/add_project_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061143),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
          // Header com texto + ícone perfil ao lado
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
                Image.asset('assets/images/logo1.png', height: 40), // lobo
              ],
            ),
          ),

          // Conteúdo principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Texto + logo das mãozinhas
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/logo2.png', height: 60),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          "SLA\nLugar onde todos tem\nsua liberdade e\nRespeito!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            height: 1.3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Botão "O que é a SLA?" mais alto
                  ElevatedButton.icon(
                    onPressed: () {
                      // Ação da SLA
                    },
                    icon: const Icon(Icons.person_outline),
                    label: const Text("O que é a SLA?"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A1C60),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(
                        double.infinity,
                        70,
                      ), // Altura maior
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Grid com 4 botões
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      children: [
                        _buildGridButton(
                          context,
                          Icons.map,
                          "MAPA ESCOLAR",
                          const MapPage(),
                        ),
                        _buildGridButton(
                          context,
                          Icons.calendar_today,
                          "DATAS",
                          const DatePage(),
                        ),
                        _buildGridButton(
                          context,
                          Icons.star_border,
                          "PROJETOS",
                          const ProjectPage(),
                        ),
                        _buildGridButton(
                          context,
                          Icons.add,
                          "ADICIONAR PROJETO",
                          const AddProjectPage(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridButton(
    BuildContext context,
    IconData icon,
    String label,
    Widget page,
  ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF0A1C60),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
