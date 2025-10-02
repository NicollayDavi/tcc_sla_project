import 'package:flutter/material.dart'; 
import 'package:flutter/services.dart';
import 'package:tcc_sla_project/pages/login_page.dart';
import 'package:tcc_sla_project/controllers/register_controller.dart';
import 'package:provider/provider.dart';
import 'package:tcc_sla_project/models/user_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nomeController = TextEditingController();
  final _rmController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;

  // Mensagens de erro exibidas abaixo dos campos
  String? _rmError;
  String? _passwordError;

  @override
  void dispose() {
    _nomeController.dispose();
    _rmController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    final nome = _nomeController.text.trim();
    final rm = _rmController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    // limpa erros visuais antes de validar
    setState(() {
      _rmError = null;
      _passwordError = null;
    });

    if (nome.isEmpty || rm.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Preencha todos os campos')));
      return;
    }

    // Validação do RM: exatamente 5 dígitos
    if (rm.length != 5) {
      setState(() {
        _rmError = 'O RM deve ter exatamente 5 números';
      });
      return;
    }

    // Validação do e-mail
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (!emailRegex.hasMatch(email) || !email.endsWith(".com")) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Digite um e-mail válido')),
      );
      return;
    }

    // Validação da senha
    if (password.contains(' ')) {
      setState(() {
        _passwordError = 'A senha não pode conter espaços';
      });
      return;
    }

    if (password.length < 5) {
      setState(() {
        _passwordError = 'A senha deve ter pelo menos 5 caracteres';
      });
      return;
    }

    if (password.length > 8) {
      setState(() {
        _passwordError = 'A senha não pode ter mais de 8 caracteres';
      });
      return;
    }

    // Chamada ao controller para cadastrar
    final success = await RegisterController.register(
      nome,
      email,
      password,
      rm,
    );

    if (success) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setUser(
        nome,
        rm,
        email,
        password,
      );

      // Exibe um AlertDialog estilizado
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: const Color(0xFF0A1A3C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Sucesso!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white, // alterado para branco
            ),
          ),
          content: const Text(
            'Conta cadastrada!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // fecha o dialog
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao realizar cadastro')),
      );
    }
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
                      'SLA',
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
              const SizedBox(height: 10),

              _buildLabel('Nome'),
              _buildInput('Digite o nome...', _nomeController),
              const SizedBox(height: 10),

              _buildLabel('RM'),
              _buildInput(
                'Digite o RM...',
                _rmController,
                isRM: true,
                errorText: _rmError,
              ),
              const SizedBox(height: 10),

              _buildLabel('E-mail'),
              _buildInput(
                'Digite o e-mail do usuário...',
                _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 10),

              _buildLabel('Senha'),
              _buildInput(
                'Digite uma senha...',
                _passwordController,
                obscure: _obscurePassword,
                isPassword: true,
                errorText: _passwordError,
              ),
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
                  child: const Text('Criar', style: TextStyle(fontSize: 18)),
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
                  child: const Text('Cancelar', style: TextStyle(fontSize: 14)),
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
    bool isPassword = false,
    bool isRM = false,
    String? errorText,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          obscureText: obscure,
          obscuringCharacter: '•',
          style: const TextStyle(color: Colors.white),
          keyboardType:
              keyboardType ??
              (isRM ? TextInputType.number : TextInputType.text),
          inputFormatters: isRM
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(5),
                ]
              : null,
          onChanged: (_) {
            if (isRM && _rmError != null) {
              setState(() {
                _rmError = null;
              });
            }
            if (isPassword && _passwordError != null) {
              setState(() {
                _passwordError = null;
              });
            }
          },
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
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white70,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : null,
          ),
        ),
        if (errorText != null) ...[
          const SizedBox(height: 5),
          Text(
            errorText,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
        ],
      ],
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
