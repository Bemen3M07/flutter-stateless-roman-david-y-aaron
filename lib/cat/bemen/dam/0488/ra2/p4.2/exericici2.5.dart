import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScoreCounter(),
    );
  }
}

class ScoreCounter extends StatefulWidget {
  @override
  State<ScoreCounter> createState() => _ScoreCounterState();
}

class _ScoreCounterState extends State<ScoreCounter> {

  // Puntuaciones de los dos equipos
  int scoreTeamA = 0;
  int scoreTeamB = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text("Exercici 2.5 – Counter"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            // COLUMNA EQUIPO A
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TEAM A",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // Puntuación del equipo A
                Text(
                  "$scoreTeamA",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // Botón SCORE para sumar puntos
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      scoreTeamA++;
                    });
                  },
                  child: Text("SCORE"),
                ),
              ],
            ),

            //COLUMNA EQUIPO B
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TEAM B",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // Puntuación del equipo B
                Text(
                  "$scoreTeamB",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                // Botón SCORE para sumar puntos
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      scoreTeamB++;
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
