// lib/pages/notes_page.dart
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes'), backgroundColor: Colors.blueAccent),
      body: NotesPage(),
    );
  }
}
