import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_sla_project/models/user_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tcc_sla_project/pages/map_page.dart';
import 'package:tcc_sla_project/pages/profile_page.dart';
import 'package:tcc_sla_project/pages/date_page.dart';
import 'package:tcc_sla_project/pages/project_page.dart';
import 'package:tcc_sla_project/pages/sla_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _abrirPaginaWeb(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Não foi possível abrir: $url';
    }
  }

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

      // 🔹 Barra inferior com cor mais clara e notch
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xFF1C2F70), // <- mesmo azul usado nas outras telas
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(height: 56),
      ),

      body: Column(
        children: [
          // HEADER
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
                    // Usando Consumer para obter o nome do usuário
                    Consumer<UserProvider>(
                      builder: (context, userProvider, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Olá, ${userProvider.user?.name ?? 'usuário'}!",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const Text(
                              "Seja bem-vindo (a)",
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Image.asset('assets/images/logo1.png', height: 60), // logo topo
              ],
            ),
          ),

          // CONTEÚDO
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Texto + ícone mãos
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/logo2.png', height: 50),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          "SLA\nLugar onde todos tem\nsua liberdade e\nRespeito!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            height: 1.3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Botão "O que é a SLA?"
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SlaPage()),
                      );
                    },
                    icon: const Icon(Icons.person_outline),
                    label: const Text("O que é a SLA?"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF12226C),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // GRID BOTÕES
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      children: [
                        _buildGridButton(context, Icons.map, "MAPA ESCOLAR", const MapPage()),
                        _buildGridButton(context, Icons.calendar_today, "DATAS", const DatePage()),
                        _buildGridButton(context, Icons.star_border, "PROJETOS", const ProjectPage()),
                        _buildGridButton(context, Icons.add, "ADICIONAR PROJETO", null, abrirWeb: _abrirPaginaWeb),
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
      Widget? page, {
      Future<void> Function(String)? abrirWeb,
    }) {
    return ElevatedButton(
      onPressed: () {
        if (label == "ADICIONAR PROJETO" && abrirWeb != null) {
          showDialog(
            context: context,
            builder: (_) {
              return Dialog(
                backgroundColor: const Color(0xFF0A1C60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/logo1.png', height: 60),
                      const SizedBox(height: 10),
                      const Text(
                        "SLA CONNECT",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Deseja ser redirecionado para página web, para poder criar um projeto?",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.black),
                            child: const Text("Cancelar"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              abrirWeb("https://sua-url-aqui.com");
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF1C2F70), foregroundColor: Colors.white),
                            child: const Text("Confirmar"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF12226C),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
