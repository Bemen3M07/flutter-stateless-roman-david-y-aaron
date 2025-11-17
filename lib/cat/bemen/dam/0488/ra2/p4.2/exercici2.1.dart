import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GoodMorningApp(),
    );
  }
}

class GoodMorningApp extends StatefulWidget {
  @override
  State<GoodMorningApp> createState() => _GoodMorningAppState();
}

class _GoodMorningAppState extends State<GoodMorningApp> {
  // Mensaje que se mostrará en pantalla
  String message = "Good ?!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      appBar: AppBar(
        title: Text("Exercici 2.1 Good Morning"),
        backgroundColor: Colors.blue, // AppBar azul
        foregroundColor: Colors.white, // Texto del AppBar blanco
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Texto principal
            Text(
              message,
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),

            const SizedBox(height: 40),

            // Botón Morning (azul con texto blanco)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,     // Color del botón
                foregroundColor: Colors.white,    // Color del texto
              ),
              onPressed: () {
                setState(() {
                  message = "Good morning";
                });
              },
              child: const Text("Morning"),
            ),

            const SizedBox(height: 20),

            // Botón Night (azul con texto blanco)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  message = "Good night";
                });
              },
              child: const Text("Night"),
            ),
          ],
        ),
      ),
    );
  }
}
