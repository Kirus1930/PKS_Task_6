import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  static const routeName = '/create';
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create account'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Your number',
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/flag_ru.png',
                          width: 20, height: 14),
                      const SizedBox(width: 6),
                      const Text('|', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
              child: const Text('Create account'),
            ),
          ],
        ),
      ),
    );
  }
}
