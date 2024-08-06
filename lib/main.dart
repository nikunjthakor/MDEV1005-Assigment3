// Import necessary packages from Flutter
import 'package:flutter/material.dart';

// Import pages for routing within the app
import 'pages/greeting_page.dart';
import 'pages/calculator_page.dart';
import 'pages/api_page.dart'; // Ensure the import for the API page is present
import 'pages/notes_page.dart';

void main() {
  // Entry point of the Flutter application
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Build the main application widget
    return MaterialApp(
      // Title of the application, displayed in the app switcher and other places
      title: 'Flutter Demo',

      // Theme data for the application, setting primary color to blue
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // Initial route to be displayed when the app starts
      initialRoute: '/',

      // Define the routes for navigation within the app
      routes: {
        // Route for the greeting page
        '/': (context) => GreetingPage(),

        // Route for the calculator page
        '/calculator': (context) => CalculatorPage(),

        // Route for the API page
        '/api': (context) => ApiPage(), // Ensure this route is properly defined

        // Route for the notes page
        '/notes': (context) => NotesPage(),
      },
    );
  }
}
