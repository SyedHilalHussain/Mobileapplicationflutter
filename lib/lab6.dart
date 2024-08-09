import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.blue, // Background color of the screen
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  color: Colors.blue, // Background color of the text container
                  padding: EdgeInsets.all(8.0), // Padding around the text
                  child: Text(
                    'Bottom Right',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 16.0, // Text size
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
