// lib/tools/simple_calculator.dart
import 'package:flutter/material.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String _display = '0';
  String _operator = '';
  double _num1 = 0;
  bool _isNewOperation = true;

  void _onDigitPressed(String digit) {
    setState(() {
      if (_isNewOperation) {
        _display = digit;
        _isNewOperation = false;
      } else {
        _display = _display == '0' ? digit : _display + digit;
      }
    });
  }

  void _onOperatorPressed(String operator) {
    setState(() {
      if (!_isNewOperation) {
        _num1 = double.parse(_display);
        _operator = operator;
        _isNewOperation = true;
      }
    });
  }

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
        _operator = '';
        _isNewOperation = true;
      }
    });
  }

  void _clear() {
    setState(() {
      _display = '0';
      _operator = '';
      _num1 = 0;
      _isNewOperation = true;
    });
  }

  Widget _buildButton(String text, {Color color = Colors.blueGrey}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {
            if (text == '=') {
              _calculateResult();
            } else if (text == 'C') {
              _clear();
            } else if (['+', '-', '*', '/'].contains(text)) {
              _onOperatorPressed(text);
            } else {
              _onDigitPressed(text);
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
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24.0),
              child: Text(
                _display,
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
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
