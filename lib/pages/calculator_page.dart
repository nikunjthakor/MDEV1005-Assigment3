// lib/pages/calculator_page.dart
import 'package:flutter/material.dart';
import '../tools/simple_calculator.dart'; // Updated import path

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Advanced Calculator'),
          backgroundColor: Colors.blueAccent),
      body: SimpleCalculator(),
    );
  }
}
