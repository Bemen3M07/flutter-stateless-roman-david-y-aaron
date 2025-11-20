import 'package:flutter/material.dart';

void main() {
  // Ejecuta la aplicación principal
  runApp(const MyApp());
}

// ---------------------------------------------------------------------------
// 🟦 1. APLICACIÓN PRINCIPAL (StatelessWidget)
// ---------------------------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScoreCounter(), // Pantalla principal del contador
    );
  }
}

// ---------------------------------------------------------------------------
// 🟦 2. WIDGET CON ESTADO QUE GESTIONA LAS PUNTUACIONES
// ---------------------------------------------------------------------------
class ScoreCounter extends StatefulWidget {
  @override
  State<ScoreCounter> createState() => _ScoreCounterState();
}

class _ScoreCounterState extends State<ScoreCounter> {

  // Puntuaciones de cada equipo
  int scoreTeamA = 0;
  int scoreTeamB = 0;

  // -------------------------------------------------------------------------
  // 🟦 3. INTERFAZ DEL CONTADOR
  // -------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Exercici 2.5 – Counter"),
        backgroundColor: Colors.blue,     // AppBar azul
        foregroundColor: Colors.white,    // Texto blanco
      ),

      body: Center(
        // Distribución horizontal: TEAM A | TEAM B
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaciado uniforme

          children: [
            // ---------------------------------------------------------------
            // 🟥 COLUMNA EQUIPO A
            // ---------------------------------------------------------------
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nombre del equipo
                Text(
                  "TEAM A",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // Puntuación mostrada en grande
                Text(
                  "$scoreTeamA",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // Botón para sumar puntos al equipo A
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,  // Fondo azul
                    foregroundColor: Colors.white, // Texto blanco
                  ),
                  onPressed: () {
                    setState(() {
                      scoreTeamA++; // Aumenta la puntuación
                    });
                  },
                  child: Text("SCORE"),
                ),
              ],
            ),

            // ---------------------------------------------------------------
            // 🟦 COLUMNA EQUIPO B
            // ---------------------------------------------------------------
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Nombre del equipo
                Text(
                  "TEAM B",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // Puntuación mostrada
                Text(
                  "$scoreTeamB",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // Botón para sumar puntos al equipo B
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      scoreTeamB++; // Suma para B
                    });
                  },
                  child: Text("SCORE"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
