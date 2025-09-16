import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AddProjectPage extends StatelessWidget {
  const AddProjectPage({super.key});

  final String _url = "http://localhost:5173/"; // troque por IP se usar no celular

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(_url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Não foi possível abrir $_url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Abrir Site")),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchUrl,
          child: const Text("Ir para o site"),
        ),
      ),
    );
  }
}
