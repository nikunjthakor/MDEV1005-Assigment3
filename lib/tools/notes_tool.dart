// Import the Flutter Material package
import 'package:flutter/material.dart';

// Define the NotesPage StatelessWidget
class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar widget to display the title and background color
      appBar: AppBar(
        title: Text('Notes'), // Title of the AppBar
        backgroundColor: Colors.blueAccent, // Background color of the AppBar
      ),

      // Body of the Scaffold where the main content of the page is displayed
      body: Center(
        child: Text(
          'Notes Page Content Goes Here',
          style: TextStyle(fontSize: 24), // Style for the text
        ),
      ),
    );
  }
}
