import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Management App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Version: 1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.green[700]),
            ),
            SizedBox(height: 8),
            Text(
              'Developer: Pascal Mathias',
              style: TextStyle(fontSize: 16, color: Colors.green[700]),
            ),
            SizedBox(height: 8),
            Text(
              'Student ID: 75652025',
              style: TextStyle(fontSize: 16, color: Colors.green[700]),
            ),
            SizedBox(height: 16),
            Text(
              'Description: Manage your contacts efficiently with this simple app.',
              style: TextStyle(fontSize: 16, color: Colors.green[700]),
            ),
          ],
        ),
      ),
    );
  }
}