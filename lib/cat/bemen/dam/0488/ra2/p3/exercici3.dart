// Exercici 3: Text amb imatge d'actius (assets)
// En aquest exercici es mostra un títol i una imatge carregada des de assets.
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp proveeix l'estructura i el tema base
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // Padding afegeix espai al voltant del Text
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Aplicación con imagen',
              ),
            ),
            // Image.asset carrega una imatge des de la carpeta assets definida a pubspec.yaml
            Image.asset('assets/images/davidtop.jpg', width: 150, height: 150),
          ],
        ),
      ),
    );
  }
}
