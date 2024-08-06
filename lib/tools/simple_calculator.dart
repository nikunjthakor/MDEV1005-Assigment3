// Import the Flutter Material package
import 'package:flutter/material.dart';

// Define a StatefulWidget for the SimpleCalculator
class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

// State class for the SimpleCalculator
class _SimpleCalculatorState extends State<SimpleCalculator> {
  // Display string on the calculator screen
  String _display = '0';

  // Operator for the current operation
  String _operator = '';

  // First number in the operation
  double _num1 = 0;

  // Flag to determine if a new operation is starting
  bool _isNewOperation = true;

  // Handle digit button presses
  void _onDigitPressed(String digit) {
    setState(() {
      // If starting a new operation, replace the display with the new digit
      if (_isNewOperation) {
        _display = digit;
        _isNewOperation = false;
      } else {
        // If not starting a new operation, append the digit to the display
        _display = _display == '0' ? digit : _display + digit;
      }
    });
  }

  // Handle operator button presses
  void _onOperatorPressed(String operator) {
    setState(() {
      // Save the current number and operator, and prepare for the next input
      if (!_isNewOperation) {
        _num1 = double.parse(_display);
        _operator = operator;
        _isNewOperation = true;
      }
    });
  }

  // Perform the calculation based on the operator and update the display
  void _calculateResult() {
    setState(() {
      if (_operator.isNotEmpty) {
        double num2 = double.parse(_display);
        switch (_operator) {
          case '+':
            _display = (_num1 + num2).toString();
            break;
          case '-':
            _display = (_num1 - num2).toString();
            break;
          case '*':
            _display = (_num1 * num2).toString();
            break;
          case '/':
            _display = num2 != 0 ? (_num1 / num2).toString() : 'Error';
            break;
        }
        // Reset operator and indicate a new operation can start
        _operator = '';
        _isNewOperation = true;
      }
    });
  }

  // Clear the calculator state
  void _clear() {
    setState(() {
      _display = '0';
      _operator = '';
      _num1 = 0;
      _isNewOperation = true;
    });
  }

  // Build a calculator button with specified text and color
  Widget _buildButton(String text, {Color color = Colors.blueGrey}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color, // Background color of the button
            padding: EdgeInsets.all(24), // Padding inside the button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), // Rounded corners
            ),
          ),
          onPressed: () {
            // Handle button presses based on the text
            if (text == '=') {
              _calculateResult(); // Calculate the result if '=' is pressed
            } else if (text == 'C') {
              _clear(); // Clear the calculator if 'C' is pressed
            } else if (['+', '-', '*', '/'].contains(text)) {
              _onOperatorPressed(text); // Handle operator presses
            } else {
              _onDigitPressed(text); // Handle digit presses
            }
          },
          child:
              Text(text, style: TextStyle(fontSize: 24, color: Colors.white)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // Background color of the calculator
      body: Column(
        children: [
          // Display section at the top
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24.0),
              child: Text(
                _display,
                style: TextStyle(
                    fontSize: 48, // Font size of the display text
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          // Calculator buttons
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  children: ['7', '8', '9']
                      .map((text) => _buildButton(text))
                      .toList(),
                ),
                Row(
                  children: ['4', '5', '6']
                      .map((text) => _buildButton(text))
                      .toList(),
                ),
                Row(
                  children: ['1', '2', '3']
                      .map((text) => _buildButton(text))
                      .toList(),
                ),
                Row(
                  children: ['0', '.', '=', 'C']
                      .map((text) => _buildButton(text, color: Colors.orange))
                      .toList(),
                ),
                Row(
                  children: ['+', '-', '*', '/']
                      .map((text) =>
                          _buildButton(text, color: Colors.orangeAccent))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
