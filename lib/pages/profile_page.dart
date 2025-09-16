import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc_sla_project/models/user_provider.dart';
import 'package:tcc_sla_project/pages/view_profile_page.dart';
import 'package:tcc_sla_project/pages/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061143),

      // Botão flutuante central igual ao HomePage
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // volta para a Home
        },
        backgroundColor: const Color(0xFF1C2F70),
        child: const Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // BottomAppBar igual ao HomePage
      bottomNavigationBar: const BottomAppBar(
        color: Color(0xFF1C2F70),
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: SizedBox(height: 56),
      ),

      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF0A1C60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Color(0xFF061143)),
                    ),
                    const SizedBox(width: 12),
                    // Usando Consumer para obter o nome do usuário
                    Consumer<UserProvider>(
                      builder: (context, userProvider, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá, ${userProvider.user?.name ?? 'usuário'}!',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'Seja bem-vindo (a)',
                              style: TextStyle(color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
                Image.asset('assets/images/logo1.png', height: 40),
              ],
            ),
          ),

          // Parte de perfil com os dados do usuário
          Container(
            width: double.infinity,
            color: const Color(0xFF061143),
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                final user = userProvider.user;
                return Column(
                  children: [
                    const CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Color(0xFF061143), size: 32),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user?.name ?? 'Nome do Usuário',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.school, color: Colors.cyanAccent),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user?.email ?? 'email@exemplo.com',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user?.rm ?? 'RM: Não informado',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                // Botão visualizar perfil
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewProfilePage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.person, size: 18),
                    label: const Text('Visualizar Perfil'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF202D5A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Botão sair da conta com diálogo de confirmação
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return Dialog(
                            backgroundColor: const Color(0xFF0A1C60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/images/logo1.png',
                                    height: 60,
                                  ),
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
                                    "Deseja realmente sair da conta?",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
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
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.grey,
                                        ),
                                        child: const Text("Cancelar"),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const LoginPage(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF1C2F70),
                                        ),
                                        child: const Text("Confirmar"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.logout, size: 18),
                    label: const Text('Sair da conta'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF202D5A),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}