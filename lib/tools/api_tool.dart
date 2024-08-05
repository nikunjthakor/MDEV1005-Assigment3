// lib/tools/api_tool.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiTool extends StatefulWidget {
  @override
  _ApiToolState createState() => _ApiToolState();
}

class _ApiToolState extends State<ApiTool> {
  List<dynamic> _quotes = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response =
        await http.get(Uri.parse('https://quotes-6oci.onrender.com/api'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      if (jsonData['success']) {
        setState(() {
          _quotes = jsonData['data'];
          _isLoading = false;
        });
      } else {
        setState(() {
          _error = 'Failed to fetch data';
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _error = 'Error: ${response.statusCode}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : _error.isNotEmpty
            ? Center(
                child: Text(_error,
                    style: TextStyle(fontSize: 24, color: Colors.red)))
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _quotes.length,
                itemBuilder: (context, index) {
                  final quote = _quotes[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quote['quote'],
                            style: TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            '- ${quote['author']}',
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
