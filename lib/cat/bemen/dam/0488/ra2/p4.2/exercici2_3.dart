import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecretNumberOrdered(),
    );
  }
}

class SecretNumberOrdered extends StatefulWidget {
  @override
  State<SecretNumberOrdered> createState() => _SecretNumberOrderedState();
}

class _SecretNumberOrderedState extends State<SecretNumberOrdered> {

  // Número secreto generado entre 0 y 100
  int secretNumber = Random().nextInt(101);

  // Controlador para leer el texto del usuario
  TextEditingController controller = TextEditingController();

  // Número de intentos realizados
  int intentos = 0;

  // Resultado después de validar
  String resultado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // -------------------------------------------------
              // 1️⃣ TÍTULO + Nº SECRETO A LA DERECHA (PARA PRUEBAS)
              // -------------------------------------------------
              Text(
                "Adivina el número secreto  ( $secretNumber )",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              // NOTA: El número secreto aparece solo para pruebas

              SizedBox(height: 30),

              // -------------------------------------------------
              // 2️⃣ INDICACIÓN + TEXTFIELD
              // -------------------------------------------------
              Text(
                "Introduce un número del 0 al 100:",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 10),

              TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Número",
                ),
              ),

              SizedBox(height: 20),

              // BOTÓN VALIDAR (AZUL)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  int? guess = int.tryParse(controller.text);

                  if (guess == null) {
                    setState(() {
                      resultado = "Introduce un número válido.";
                    });
                    return;
                  }

                  // Suma un intento
                  intentos++;

                  // Comprobación
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
                      resultado = "¡Has acertado!";
                    });
                  }
                },
                child: Text("VALIDAR"),
              ),

              SizedBox(height: 20),

              //  CONTADOR DE INTENTOS

              Text(
                "Intentos: $intentos",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              //  RESULTADO DEL JUEGO
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
