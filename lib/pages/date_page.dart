import 'package:flutter/material.dart';
import 'package:tcc_sla_project/pages/profile_page.dart';
import 'package:tcc_sla_project/pages/home_page.dart';

class DatePage extends StatelessWidget {
  const DatePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Força o mês para JULHO do ano atual
    final DateTime now = DateTime.now();
    final DateTime fixedDate = DateTime(now.year, 7, 1);

    final int daysInMonth = DateTime(fixedDate.year, fixedDate.month + 1, 0).day;
    final int firstWeekday = fixedDate.weekday; // 1 = seg, 7 = dom

    // Lista de widgets dos dias
    final List<Widget> dayWidgets = [];

    // Espaços antes do 1º dia do mês
    for (int i = 1; i < firstWeekday; i++) {
      dayWidgets.add(const SizedBox());
    }

    // Dias do mês
    for (int day = 1; day <= daysInMonth; day++) {
      final bool isSelected = (day == 2 || day == 3); // ✅ bolinha verde nos dias 2 e 3

      dayWidgets.add(
        Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.transparent,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            "$day",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFF061143),

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

      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1C2F70),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: const SizedBox(height: 56),
      ),

      body: Column(
        children: [
          // 🔹 Cabeçalho
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
            'DATAS:',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

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
                  // 🔹 Sempre JULHO
                  Text(
                    "Julho ${fixedDate.year}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

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
            'Das 08:00 às 18:00 Horas',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
