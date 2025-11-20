import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_provider.dart';

// Importa tus ejercicios aquí
import 'exercicis/exercici2.1.dart';
import 'exercicis/exercici2.2.dart';
import 'exercicis/exercici2.3.dart';
import 'exercicis/exercici2.4.dart';
import 'exercicis/exercici2.5.dart';
import 'exercicis/exercici2.6.dart';
import 'exercicis/exercici2.7.dart';
import 'exercicis/exercici2.8.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationProvider>(context);

    // Agrupamos los ejercicios por tipo
    final statelessExercises = [
      exercici21(),
      Exercici22(),
      Exercici23(),
      Exercici24(),
    ];

    final statefulExercises = [
      Exercici25(),
      Exercici26(),
      Exercici27(),
      Exercici28(),
    ];

    final exercises = nav.pageIndex == 0
        ? statelessExercises
        : statefulExercises;

    return Scaffold(
      appBar: AppBar(
        title: Text("Exercici ${nav.exerciseIndex + 1 + (nav.pageIndex == 0 ? 0 : 4)}"),
        actions: List.generate(exercises.length, (i) {
          return TextButton(
            onPressed: () => nav.setExercise(i),
            child: Text(
              "Ex ${i + 1 + (nav.pageIndex == 0 ? 0 : 4)}",
              style: const TextStyle(color: Colors.white),
            ),
          );
        }),
      ),

      body: exercises[nav.exerciseIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: nav.pageIndex,
        onTap: nav.setPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: "Stateless",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: "Stateful",
          ),
        ],
      ),
    );
  }
}
