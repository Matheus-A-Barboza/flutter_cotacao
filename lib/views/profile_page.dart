import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
      ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String email = args['username'];
    final String username = args['email'];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Perfil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('img/miranha.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              '$email',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '$username',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Adicione a lógica para editar o perfil aqui
              },
              child: Text('Editar Perfil'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Volta para a tela de login
                Navigator.pushReplacementNamed(context, '/'); // Substitui a tela atual pela tela de login
              },
              child: Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
