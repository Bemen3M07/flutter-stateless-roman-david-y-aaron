import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Punto de entrada de la aplicación de los dados.
// Ejecuta la app principal que contiene la pantalla de lanzamiento.
void main() => runApp(const DiceRollerApp());

// Widget sin estado que configura el MaterialApp.
class DiceRollerApp extends StatelessWidget {
  const DiceRollerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller - Exercici 2.4',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // La pantalla principal es DicePage.
      home: const DicePage(),
    );
  }
}

// Página con estado que maneja la lógica del lanzamiento de dados.
class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  // Generador aleatorio para simular las tiradas.
  final Random _rng = Random();

  // Variables que guardan la cara actual de cada dado (1..6).
  // Si son null, mostramos una imagen vacía/placeholder.
  int? _left;
  int? _right;

  // Método que simula el lanzamiento de dos dados.
  // Genera dos enteros aleatorios entre 1 y 6 y actualiza el estado.
  void _rollDice() {
    final l = _rng.nextInt(6) + 1; // nextInt(6) -> 0..5, +1 => 1..6
    final r = _rng.nextInt(6) + 1;

    // Actualizamos las caras mostradas en la UI.
    setState(() {
      _left = l;
      _right = r;
    });

    // Requerimiento: si salen dos 6, mostrar un mensaje tipo Toast.
    // Usamos SnackBar (equivalente en Flutter) para mostrar "JACKPOT!".
    if (l == 6 && r == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('JACKPOT!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  // Devuelve la ruta del asset SVG para la cara indicada.
  // Si la cara es null, devolvemos un SVG vacío (placeholder).
  String _assetForFace(int? face) {
    if (face == null) return 'assets/diceroller/empty_dice.svg';
    return 'assets/diceroller/dice_${face}.svg';
  }

  @override
  Widget build(BuildContext context) {
    // Estructura principal: Scaffold con AppBar, imagenes de dados y botón.
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Dice Roller'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Fila con los dos dados: izquierda y derecha.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Dado izquierdo: cargamos el SVG correspondiente.
                    SvgPicture.asset(
                      _assetForFace(_left),
                      width: 140,
                      height: 140,
                    ),
                    const SizedBox(width: 20),
                    // Dado derecho: igual que el izquierdo.
                    SvgPicture.asset(
                      _assetForFace(_right),
                      width: 140,
                      height: 140,
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                // Botón que lanza los dados al pulsarlo.
                ElevatedButton(
                  onPressed: _rollDice,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[800],
                    padding:
                        const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'ROLL THE DICE',
                    style: TextStyle(fontSize: 16, letterSpacing: 1.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
