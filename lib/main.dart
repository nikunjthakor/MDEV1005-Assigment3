// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/greeting_page.dart';
import 'pages/calculator_page.dart';
import 'pages/api_page.dart';  // Make sure this import is present
import 'pages/notes_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => GreetingPage(),
        '/calculator': (context) => CalculatorPage(),
        '/api': (context) => ApiPage(),  // This should now be recognized
        '/notes': (context) => NotesPage(),
      },
    );
  }
}