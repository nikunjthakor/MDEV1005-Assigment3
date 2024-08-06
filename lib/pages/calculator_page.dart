// Import necessary Flutter material package
import 'package:flutter/material.dart';
// Import the SimpleCalculator widget from the tools directory
import '../tools/simple_calculator.dart'; // Updated import path

// Define a stateless widget for the CalculatorPage
class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with title and background color
      appBar: AppBar(
        title: Text('Advanced Calculator'),
        backgroundColor: Colors.blueAccent,
      ),
      // Body of the scaffold containing the SimpleCalculator widget
      body: SimpleCalculator(),
    );
  }
}
