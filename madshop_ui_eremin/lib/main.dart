import 'package:flutter/material.dart';

void main() => runApp(const SimpleNotesApp());

class SimpleNotesApp extends StatelessWidget {
  const SimpleNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Практика 6',
      // theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  void CheckInput() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              initialValue: _email,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Email' : null,
            ),
            TextFormField(
              initialValue: _password,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Password' : null,
            ),
            TextFormField(
              initialValue: _phone,
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Your number' : null,
            ),
            GestureDetector(
              onTap: CheckInput,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text(
                    "Done",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
