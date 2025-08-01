import 'package:flutter/material.dart';
import 'package:tcc_sla_project/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _rmController = TextEditingController();

  void _register() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();
    final rm = _rmController.text.trim();

    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        rm.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Preencha todos os campos')));
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('As senhas não coincidem')));
      return;
    }

    // Aqui você pode continuar com o processo de cadastro
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Cadastro realizado com sucesso')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF030C2C),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: 10),
              Center(
                child: SizedBox(
                  width: 160,
                  height: 160,
                  child: Image.asset('assets/images/logo1.png'),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Column(
                  children: [
                    Text(
                      'S L A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: 4,
                      ),
                    ),
                    Text(
                      'CONNECT',
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'CADASTRO',
                  style: TextStyle(
                    fontFamily: 'Courier',
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              _buildLabel("E-mail"),
              _buildInput("Digite o e-mail do usuário...", _emailController),
              const SizedBox(height: 10),
              _buildLabel("Senha"),
              _buildInput(
                "Digite uma senha...",
                _passwordController,
                obscure: true,
              ),
              const SizedBox(height: 10),
              _buildLabel("Confirmar senha"),
              _buildInput(
                "Confirme a senha...",
                _confirmPasswordController,
                obscure: true,
              ),
              const SizedBox(height: 10),
              _buildLabel("Rm"),
              _buildInput("Digite o rm...", _rmController),
              const SizedBox(height: 25),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Entrar", style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Logar", style: TextStyle(fontSize: 14)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInput(
    String hint,
    TextEditingController controller, {
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: const Color(0xFF0A1A3C),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
    );
  }
}
