import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tcc_sla_project/models/user_provider.dart';
import 'package:tcc_sla_project/pages/profile_page.dart';
import 'package:tcc_sla_project/pages/home_page.dart';

class SlaPage extends StatelessWidget {
  const SlaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061143),

      // Botão Home no centro
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
          // 🔹 Cabeçalho padronizado com nome do usuário
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
                          MaterialPageRoute(builder: (_) => const ProfilePage()),
                        );
                      },
                      child: const Icon(Icons.person, color: Colors.white, size: 36),
                    ),
                    const SizedBox(width: 12),

                    Consumer<UserProvider>(
                      builder: (context, userProvider, child) {
                        final user = userProvider.user;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Olá, ${user?.name ?? 'usuário'}!",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Image.asset('assets/images/logo1.png', height: 60),
              ],
            ),
          ),

          // Conteúdo principal
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "O que é a SLA?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "A SLA é um movimento transformador voltado para o crescimento pessoal, profissional e espiritual de jovens e líderes em formação. "
                    "Criada com o propósito de despertar uma geração consciente de seu propósito e identidade, a SLA promove uma jornada intensa de imersão, aprendizado e conexão.\n\n"
                    "Durante a semana, os participantes vivenciam experiências com palestras inspiradoras, painéis temáticos, oficinas práticas e momentos de comunhão profunda. "
                    "A SLA se tornou um ponto de virada na vida de centenas de jovens. Cada edição é única, mas todas carregam a mesma essência: libertar mentes, alinhar corações e despertar líderes que impactam o mundo ao seu redor. "
                    "É um espaço onde a liberdade não é vista como ausência de limites, mas como a capacidade de viver com propósito e influência.",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
