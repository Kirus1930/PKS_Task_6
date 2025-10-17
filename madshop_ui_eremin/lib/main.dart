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
  final List<Note> _notes = [
    Note(id: '1', title: 'Пример', body: 'Это пример заметки'),
  ];

  final TextEditingController _searchController = TextEditingController();
  List<Note> _filteredNotes = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _filteredNotes = _notes;
    _searchController.addListener(_filterNotes);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterNotes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredNotes = _notes;
      } else {
        _filteredNotes = _notes
            .where((note) => note.title.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchController.clear();
      _filteredNotes = _notes;
    });
  }

  Future<void> _addNote() async {
    final newNote = await Navigator.push<Note>(
      context,
      MaterialPageRoute(builder: (_) => EditNotePage()),
    );
    if (newNote != null) {
      setState(() {
        _notes.add(newNote);
        _filterNotes(); // Обновляем фильтрацию после добавления
      });
    }
  }

  Future<void> _edit(Note note) async {
    final updated = await Navigator.push<Note>(
      context,
      MaterialPageRoute(builder: (_) => EditNotePage(existing: note)),
    );
    if (updated != null) {
      setState(() {
        final i = _notes.indexWhere((n) => n.id == updated.id);
        if (i != -1) _notes[i] = updated;
        _filterNotes(); // Обновляем фильтрацию после редактирования
      });
    }
  }

  void _delete(Note note) {
    setState(() {
      _notes.removeWhere((n) => n.id == note.id);
      _filterNotes(); // Обновляем фильтрацию после удаления
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Заметка удалена')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: _stopSearch,
            )
          else
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: _startSearch,
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
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
