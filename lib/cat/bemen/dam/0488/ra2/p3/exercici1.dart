// Exercici 1: "Hello World" bàsic en Flutter
// En aquest fitxer només s'afegeixen comentaris per explicar el codi, sense canviar-ne el funcionament.
import 'package:flutter/material.dart';

void main() {
  // Punt d'entrada de l'aplicació. runApp muntarà el widget root a la pantalla.
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp proporciona el tema i la navegació bàsica de Material Design
    return const MaterialApp(
      // Scaffold crea una estructura visual bàsica (app bar, body, floatingActionButton, etc.)
      home: Scaffold(
        // Center centra el seu fill tant horitzontalment com verticalment
        body: Center(
          // Text mostra una cadena simple a la pantalla
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
