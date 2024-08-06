// Import necessary Flutter material package
import 'package:flutter/material.dart';
// Import the ApiTool widget from the tools directory
import 'package:assignment_3/tools/api_tool.dart';

// Define a stateless widget for the ApiPage
class ApiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with title and background color
      appBar: AppBar(
        title: Text('API Tool'),
        backgroundColor: Colors.blueAccent,
      ),
      // Body of the scaffold containing the ApiTool widget
      body: ApiTool(),
    );
  }
}
