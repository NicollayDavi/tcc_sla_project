import 'package:flutter/material.dart';
import 'package:tcc_sla_project/core/util/nav.dart';
import 'package:tcc_sla_project/modules/categories/category_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SLA Connect'),
        centerTitle: true,
        backgroundColor: const Color(0XFF0C1B2A),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(1),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0XFF0C1B2A),
              ) ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  ),

                  Text('Arnaldão Grosso', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  ),
                ],
              ) 
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Categorias'),
                onTap: () => {
                  
                push(context, CategoryPage())
                  
                 },
              ),
                ListTile(
                leading: const Icon(Icons.question_answer),
                title: const Text('Perguntas'),
                onTap: () => {
                  print('Clicado em Perguntas')
                 },
              ),
              ListTile(
                leading: const Icon(Icons.check_circle_outline ),
                title: const Text('Respostas'),
                onTap: () => {
                  print('Clicado em Respostas')
                 },
              ),
          ],
        ),

      ) ,
      body: Center(
        child: Text('Seja bem-vindo ao App')
      ),
    );
  }
}