import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  static const routeName = '/password';
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Password')),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
                controller: passController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed('/shop'),
              child: const Text('Enter'),
            )
          ],
        ),
      ),
    );
  }
}
