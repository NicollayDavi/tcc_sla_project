import 'package:flutter/material.dart';
import 'package:tcc_sla_project/pages/home_page.dart';

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF061143),

      // Botão central (Home)
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomePage()),
          );
        },
        backgroundColor: const Color(0xFF1C2F70),
        child: const Icon(Icons.home, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // Barra inferior igual à HomePage
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1C2F70),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: const SizedBox(height: 56),
      ),

      // Conteúdo da página
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
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Seja bem-vindo (a)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset('assets/images/logo1.png', height: 40),
                ],
              ),
              const SizedBox(height: 20),

              // Seção de Datas
              const Text(
                'DATAS:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildCalendar(),

              const SizedBox(height: 20),

              // Seção de Horários
              const Text(
                'Horários:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Das 08:00 às 18:00 Hrs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          const Text(
            'Julho 2025',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'segunda',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              Text(
                'terça',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              Text(
                'quarta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              Text(
                'quinta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              Text(
                'sexta',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
              ),
              Text(
                'sábado',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 10,
                ),
              ),
              Text(
                'domingo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const Divider(),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0,
            ),
            itemCount: 31,
            itemBuilder: (context, index) {
              final day = index + 1;
              final bool isToday = day == 2 || day == 3;
              final bool isWeekend = (index % 7 == 5) || (index % 7 == 6);

              return Center(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: isToday
                      ? const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        )
                      : null,
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        color: isWeekend
                            ? Colors.red
                            : isToday
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
