import 'dart:math'; // Para generar números aleatorios
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Ejecuta la aplicación
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp con la pantalla principal del juego
    return MaterialApp(
      home: SecretNumberOrdered(),
    );
  }
}

// ---------------------------------------------------------------------------
// 1️⃣ StatefulWidget para el juego del número secreto
// ---------------------------------------------------------------------------
class SecretNumberOrdered extends StatefulWidget {
  @override
  State<SecretNumberOrdered> createState() => _SecretNumberOrderedState();
}

// ---------------------------------------------------------------------------
// 2️⃣ Estado del widget: contiene la lógica del juego
// ---------------------------------------------------------------------------
class _SecretNumberOrderedState extends State<SecretNumberOrdered> {

  // Número secreto entre 0 y 100 generado aleatoriamente
  int secretNumber = Random().nextInt(101);

  // Controlador para leer el número que escribe el usuario
  TextEditingController controller = TextEditingController();

  // Contador de intentos
  int intentos = 0;

  // Mensaje de resultado (mayor, menor, acertado, inválido)
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco del juego

      body: Padding(
        padding: const EdgeInsets.all(20), // Margen general
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // -----------------------------------------------------------------
              // 🟦 1. TÍTULO DEL JUEGO (incluye el número secreto para pruebas)
              // -----------------------------------------------------------------
              Text(
                "Adivina el número secreto  ( $secretNumber )", 
                // NOTA: Se muestra solo para comprobar si funciona
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 30),

              // -----------------------------------------------------------------
              // 🟦 2. INDICACIÓN AL USUARIO + CAMPO DE TEXTO
              // -----------------------------------------------------------------
              Text(
                "Introduce un número del 0 al 100:",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 10),

              TextField(
                controller: controller, // Recoge lo que escribe el usuario
                keyboardType: TextInputType.number, // Teclado numérico
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Número",
                ),
              ),

              SizedBox(height: 20),

              // -----------------------------------------------------------------
              // 🟦 3. BOTÓN VALIDAR (compara la respuesta con el número secreto)
              // -----------------------------------------------------------------
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Botón azul
                  foregroundColor: Colors.white, // Texto blanco
                ),
                onPressed: () {
                  int? guess = int.tryParse(controller.text); // Intenta convertir a número

                  // Si no es número → error
                  if (guess == null) {
                    setState(() {
                      resultado = "Introduce un número válido.";
                    });
                    return;
                  }

                  // Sumar intento
                  intentos++;

                  // Comparar con el número secreto
                  if (guess < secretNumber) {
                    setState(() {
                      resultado = "El número que buscas es más grande.";
                    });
                  } else if (guess > secretNumber) {
                    setState(() {
                      resultado = "El número que buscas es más pequeño.";
                    });
                  } else {
                    setState(() {
                      resultado = "¡Has acertado! 🎉";
                    });
                  }
                },
                child: Text("VALIDAR"),
              ),

              SizedBox(height: 20),

              // -----------------------------------------------------------------
              // 🟦 4. CONTADOR DE INTENTOS
              // -----------------------------------------------------------------
              Text(
                "Intentos: $intentos",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              // -----------------------------------------------------------------
              // 🟦 5. MENSAJE DE RESULTADO
              // -----------------------------------------------------------------
              Text(
                resultado,
                style: TextStyle(fontSize: 22, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
