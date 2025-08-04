import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Adicione no pubspec.yaml

class QRCodePage extends StatelessWidget {
  final String username;

  const QRCodePage({Key? key, this.username = "usuário"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A1128), // Azul escuro
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2331),
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(Icons.account_circle, size: 40, color: Colors.white),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Olá, $username!",
                    style: const TextStyle(color: Colors.white, fontSize: 16)),
                const Text("Seja bem-vinde (a)",
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.fireplace_outlined, color: Colors.white), // Substitua pelo logo
          ),
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.purple],
              stops: [0.0, 0.16, 0.33, 0.5, 0.66, 0.83],
            ),
          ),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: QrImageView(
              data: "https://exemplo.com/perfil/$username",
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1C2331),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        currentIndex: 2, // índice do ícone QR
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.star_border), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: ''),
        ],
        onTap: (index) {
          // Aqui você pode redirecionar para outras páginas
        },
      ),
    );
  }
}
