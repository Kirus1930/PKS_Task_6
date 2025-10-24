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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            const Text('Phone', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // A small flag (use an asset or emoji). This is used instead of "+7".
                      // To replace with exported flag from Figma, put flag image into assets/images/flag_ru.png
                      // and replace Text('🇷🇺') below with Image.asset('assets/images/flag_ru.png', width:20,height:14)
                      const Text('🇷🇺', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 6),
                      const Text('|', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // A small flag (use an asset or emoji). This is used instead of "+7".
                      // To replace with exported flag from Figma, put flag image into assets/images/flag_ru.png
                      // and replace Text('🇷🇺') below with Image.asset('assets/images/flag_ru.png', width:20,height:14)
                      const Text('🇷🇺', style: TextStyle(fontSize: 20)),
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
