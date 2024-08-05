// lib/pages/api_page.dart
import 'package:assignment_3/tools/api_tool.dart';
import 'package:flutter/material.dart';

class ApiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('API Tool'), backgroundColor: Colors.blueAccent),
      body: ApiTool(),
    );
  }
}
