import 'package:flutter/material.dart';
import 'tela_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Adicionar o AppBar
      appBar: AppBar(
        title: const Text('Página Inicial'),
        // O ícone do menu (hambúrguer) é adicionado automaticamente
        // quando um Drawer está presente no Scaffold.
      ),
      // 2. Adicionar o Drawer
      drawer: Drawer(
        child: ListView(
          // Importante: Remova qualquer padding do ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            // 3. Adicionar um DrawerHeader (Opcional, mas recomendado para estilo)
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent, // Cor de fundo do cabeçalho do Drawer
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // 4. Adicionar itens de menu (ListTile)
            ListTile(
              leading: const Icon(Icons.home), // Ícone à esquerda
              title: const Text('Tela inicial'),
              onTap: () {
                // Ação ao tocar: Fechar o drawer
                Navigator.pop(context); // Fecha o Drawer
                // Se já estiver na HomeScreen, não precisa fazer nada.
                // Se fosse para outra tela, usaria Navigator.pushNamed(context, '/outraTela');
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      // Corpo da HomeScreen (mantém o botão de login, se desejar, ou altere)
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bem-vindo à Página Inicial',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent, // Cor de fundo do botão
                foregroundColor: Colors.white, // Cor do texto do botão
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Fazer Login'),
            ),
          ],
        ),
      ),
    );
  }
}