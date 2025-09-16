import 'package:flutter/material.dart';
import 'package:tcc_sla_project/pages/profile_page.dart';
import 'package:tcc_sla_project/pages/home_page.dart';

class DatePage extends StatelessWidget {
  const DatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final int daysInMonth = DateTime(now.year, now.month + 1, 0).day;
    final int firstWeekday = DateTime(now.year, now.month, 1).weekday; // 1 = segunda, 7 = domingo

    // Cria lista com dias do mês + espaços em branco do início
    final List<Widget> dayWidgets = [];

    // Espaços antes do 1º dia
    for (int i = 1; i < firstWeekday; i++) {
      dayWidgets.add(const SizedBox());
    }

    // Dias do mês
    for (int day = 1; day <= daysInMonth; day++) {
      final bool isToday = day == now.day;

      dayWidgets.add(
        Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isToday ? Colors.green : Colors.transparent,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            "$day",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isToday ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    }

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
          // Cabeçalho padronizado
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

          // Título "DATAS"
          const Text(
            'DATAS:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // Calendário manual
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Mês e ano
                  Text(
                    "${_mesPorExtenso(now.month)} ${now.year}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Dias da semana
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text("seg", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("ter", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("qua", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("qui", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("sex", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("sáb", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      Text("dom", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Dias em grid
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 7,
                      children: dayWidgets,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Texto "Horários"
          const Text(
            'Horários:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Das 08:00 às 18:00 Hrs',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  String _mesPorExtenso(int mes) {
    const meses = [
      "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
      "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
    ];
    return meses[mes - 1];
  }
}
