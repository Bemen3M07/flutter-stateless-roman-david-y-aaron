import 'dart:math'; // Para generar números aleatorios (caras de los dados)
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ---------------------------------------------------------------------------
// 🟦 1. FUNCIÓN PRINCIPAL
// ---------------------------------------------------------------------------
// Ejecuta la aplicación que muestra la pantalla principal de los dados.
void main() => runApp(const DiceRollerApp());

// ---------------------------------------------------------------------------
// 🟦 2. APLICACIÓN PRINCIPAL (StatelessWidget)
// ---------------------------------------------------------------------------
class DiceRollerApp extends StatelessWidget {
  const DiceRollerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller - Exercici 2.4',

      // Tema general de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),

      // Pantalla principal
      home: const DicePage(),
    );
  }
}

// ---------------------------------------------------------------------------
// 🟦 3. PÁGINA PRINCIPAL (StatefulWidget)
// ---------------------------------------------------------------------------
// Maneja el lanzamiento de dados y actualiza las imágenes
class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

// ---------------------------------------------------------------------------
// 🟦 4. ESTADO DE LA PÁGINA DEL JUEGO
// ---------------------------------------------------------------------------
class _DicePageState extends State<DicePage> {
  // Generador aleatorio
  final Random _rng = Random();

  // Variables que guardan la cara actual de cada dado (1 a 6)
  // Si son null → se muestra un dado vacío (placeholder)
  int? _left;
  int? _right;

  // Función que simula lanzar dos dados
  void _rollDice() {
    // Asignamos valores aleatorios entre 1 y 6
    final l = _rng.nextInt(6) + 1;
    final r = _rng.nextInt(6) + 1;

    // Actualizamos la interfaz con las nuevas caras del dado
    setState(() {
      _left = l;
      _right = r;
    });

    // Si ambos son 6 → mostrar "JACKPOT!" mediante SnackBar
    if (l == 6 && r == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('JACKPOT!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  // Devuelve la ruta del archivo SVG que corresponde a la cara recibida
  // Si es null, devuelve la imagen vacía
  String _assetForFace(int? face) {
    if (face == null) return 'assets/diceroller/empty_dice.svg';
    return 'assets/diceroller/dice_${face}.svg';
  }

  // ---------------------------------------------------------------------------
  // 🟦 5. CONSTRUCCIÓN DE LA INTERFAZ
  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Color de fondo

      appBar: AppBar(
        title: const Text('Dice Roller'),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Espaciado general
            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                // -------------------------------------------------------------
                // 🎲 FILA CON LOS DOS DADOS
                // -------------------------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Dado izquierdo
                    SvgPicture.asset(
                      _assetForFace(_left),
                      width: 140,
                      height: 140,
                    ),

                    const SizedBox(width: 20),

                    // Dado derecho
                    SvgPicture.asset(
                      _assetForFace(_right),
                      width: 140,
                      height: 140,
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                // -------------------------------------------------------------
                // 🔘 BOTÓN PARA LANZAR LOS DADOS
                // -------------------------------------------------------------
                ElevatedButton(
                  onPressed: _rollDice,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[800],
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28, 
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Botón redondo
                    ),
                  ),
                  child: const Text(
                    'ROLL THE DICE',
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1.2, // Espaciado entre letras
                    ),
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
