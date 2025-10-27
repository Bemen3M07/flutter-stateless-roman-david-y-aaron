import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Aplicación con imagen',
              ),
            ),
            Image.asset('assets/images/davidtop.jpg', width: 150, height: 150),
          ],
        ),
      ),
    );
  }
}
