// Import necessary packages
import 'dart:convert'; // For JSON decoding
import 'package:flutter/material.dart'; // For Flutter widgets
import 'package:http/http.dart' as http; // For HTTP requests

// Define the ApiTool StatefulWidget
class ApiTool extends StatefulWidget {
  @override
  _ApiToolState createState() => _ApiToolState();
}

// State class for ApiTool
class _ApiToolState extends State<ApiTool> {
  // List to store quotes fetched from the API
  List<dynamic> _quotes = [];

  // Flag to track loading state
  bool _isLoading = true;

  // String to store error messages
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchData(); // Fetch data when the widget is initialized
  }

  // Fetch data from the API
  Future<void> _fetchData() async {
    try {
      // Send HTTP GET request to the API
      final response =
          await http.get(Uri.parse('https://quotes-6oci.onrender.com/api'));

      // Check if the response status is OK (200)
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body); // Decode JSON response
        // Check if the API response is successful
        if (jsonData['success']) {
          setState(() {
            _quotes = jsonData['data']; // Update quotes list with data from API
            _isLoading = false; // Set loading flag to false
          });
        } else {
          setState(() {
            _error = 'Failed to fetch data'; // Set error message
            _isLoading = false; // Set loading flag to false
          });
        }
      } else {
        setState(() {
          _error =
              'Error: ${response.statusCode}'; // Set error message with status code
          _isLoading = false; // Set loading flag to false
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Exception: $e'; // Handle exceptions and set error message
        _isLoading = false; // Set loading flag to false
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child:
                CircularProgressIndicator()) // Show loading spinner while fetching data
        : _error.isNotEmpty
            ? Center(
                child: Text(_error,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors
                            .red))) // Show error message if there's an error
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _quotes.length, // Number of items in the list
                itemBuilder: (context, index) {
                  final quote = _quotes[index]; // Get quote at current index
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quote['quote'], // Display the quote text
                            style: TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '- ${quote['author']}', // Display the author of the quote
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
  }
}
