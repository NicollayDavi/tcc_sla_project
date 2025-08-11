import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

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
        title: const Text(
          "Perfil",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset('assets/images/logo1.png', height: 36),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50, color: Color(0xFF061143)),
            ),
            const SizedBox(height: 8),
            const Text(
              "Usuário",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1C2F70),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildTextField(label: "Nome:"),
                  const SizedBox(height: 12),
                  _buildTextField(label: "Apelido:"),
                  const SizedBox(height: 12),
                  _buildTextField(
                    label: "EMAIL",
                    hintText: "xxxxxx@gmail.com",
                    icon: Icons.email,
                    readOnly: true,
                  ),
                  const SizedBox(height: 12),
                  _buildTextField(
                    label: "Senha",
                    hintText: "**********",
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // lógica para salvar alterações
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF061143),
                        side: const BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Salvar"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildTextField({
    required String label,
    String? hintText,
    IconData? icon,
    bool obscureText = false,
    bool readOnly = false,
  }) {
    return TextField(
      obscureText: obscureText,
      readOnly: readOnly,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white70),
        prefixIcon: icon != null ? Icon(icon, color: Colors.white70) : null,
        filled: true,
        fillColor: const Color(0xFF061143),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
