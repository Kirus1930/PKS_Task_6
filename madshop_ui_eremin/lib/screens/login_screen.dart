import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: loginController,
                decoration: const InputDecoration(labelText: 'Login')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/password'),
              child: const Text('Next'),
            )
          ],
        ),
      ),
    );
  }
}
