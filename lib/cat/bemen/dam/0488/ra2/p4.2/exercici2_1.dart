import 'package:flutter/material.dart';

void main() {
  // Punto de entrada de la aplicación
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp es el contenedor principal de la app
    return MaterialApp(
      home: GoodMorningApp(), // Pantalla inicial
    );
  }
}

class GoodMorningApp extends StatefulWidget {
  @override
  State<GoodMorningApp> createState() => _GoodMorningAppState();
}

class _GoodMorningAppState extends State<GoodMorningApp> {
  // Mensaje que se mostrará en pantalla y que cambia al pulsar botones
  String message = "Good ?!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco de la pantalla
      appBar: AppBar(
        title: Text("Exercici 2.1 Good Morning"),
        backgroundColor: Colors.blue, // Color azul del AppBar
        foregroundColor: Colors.white, // Texto blanco del AppBar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centrar contenido
          children: [
            // Texto que muestra el mensaje actual
            Text(
              message,
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),

            const SizedBox(height: 40), // Separación vertical

            // Botón "Morning"
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,     // Color del botón
                foregroundColor: Colors.white,    // Color del texto
              ),
              onPressed: () {
                // Actualiza el estado para cambiar el mensaje
                setState(() {
                  message = "Good morning";
                });
              },
              child: const Text("Morning"),
            ),

            const SizedBox(height: 20),

            // Botón "Night"
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // Cambia el mensaje al pulsar "Night"
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
