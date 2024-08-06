// Import the Flutter Material package for using Material Design widgets
import 'package:flutter/material.dart';

// Define the NotesPage StatefulWidget
class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

// State class for NotesPage
class _NotesPageState extends State<NotesPage> {
  // List to store notes
  final List<String> _notes = [];

  // Controller for the TextField to manage text input
  final TextEditingController _controller = TextEditingController();

  // Method to add a note to the list
  void _addNote() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _notes.add(_controller.text); // Add the note to the list
        _controller.clear(); // Clear the input field
      });
    }
  }

  // Method to delete a note at a specific index
  void _deleteNoteAt(int index) {
    setState(() {
      _notes.removeAt(index); // Remove the note from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar for the page title
      appBar: AppBar(
        title: Text('Notes Page'), // Title of the AppBar
        backgroundColor: Colors.blueAccent, // Background color of the AppBar
      ),
      // Main body of the page
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // TextField for inputting notes
            TextField(
              controller: _controller, // Controller to manage text input
              decoration: InputDecoration(
                labelText: 'Enter note', // Label displayed inside the TextField
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Rounded corners for the border
                ),
                filled: true,
                fillColor: Colors
                    .blueAccent[50], // Background color inside the TextField
              ),
            ),
            SizedBox(height: 20), // Space between TextField and Button
            // Button to add a note
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blueAccent, // Background color of the Button
                padding: EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12), // Padding inside the Button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Rounded corners for the Button
                ),
              ),
              onPressed: _addNote, // Method to call when Button is pressed
              child: Text('Add Note',
                  style: TextStyle(fontSize: 18)), // Button text
            ),
            SizedBox(height: 20), // Space between Button and ListView
            // Display notes or a message if no notes are present
            Expanded(
              child: _notes.isEmpty
                  ? Center(
                      child: Text(
                        'No notes added yet!', // Message displayed if no notes are present
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _notes.length, // Number of notes to display
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 4, // Shadow effect for the Card
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0), // Margin around the Card
                          child: ListTile(
                            title: Text(
                              _notes[index], // Display the note text
                              style: TextStyle(fontSize: 18),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete,
                                  color: Colors.red), // Delete icon
                              onPressed: () => _deleteNoteAt(
                                  index), // Method to call when icon is pressed
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
