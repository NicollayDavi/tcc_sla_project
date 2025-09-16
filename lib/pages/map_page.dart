import 'package:flutter/material.dart';
import 'package:tcc_sla_project/pages/profile_page.dart';
import 'package:tcc_sla_project/pages/home_page.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061143),

      // Botão flutuante central (voltar para a Home)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
            (route) => false,
          );
        },
        backgroundColor: const Color(0xFF1C2F70),
        child: const Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Barra inferior
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1C2F70),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: const SizedBox(height: 56),
      ),

      body: Column(
        children: [
          // Cabeçalho igual ao da tela de projetos
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
          // Título centralizado como na tela de projetos
          const Text(
            'Mapa Escolar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // Imagem um pouco mais acima
          Expanded(
            child: Align(
              alignment: Alignment.topCenter, // <<< faz a imagem subir
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Image.asset(
                      'assets/images/planta.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
