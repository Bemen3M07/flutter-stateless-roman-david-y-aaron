import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Comptador de Passos',
      home: PedometerScreen(),
    );
  }
}

class PedometerScreen extends StatefulWidget {
  const PedometerScreen({super.key});

  @override
  State<PedometerScreen> createState() => _PedometerScreenState();
}

class _PedometerScreenState extends State<PedometerScreen> {
  late Stream<StepCount> _stepCountStream;
  String _steps = '0';
  String _status = 'Detectant...';

  @override
  void initState() {
    super.initState();
    _checkPermissionAndInitPedometer();
  }

  // Comprova i sol·licita el permís d'Activitat
  Future<void> _checkPermissionAndInitPedometer() async {
    // Sol·licita el permís de reconeixement d'activitat
    if (await Permission.activityRecognition.request().isGranted) {
      // El permís ha estat concedit, inicia el podòmetre
      _initPedometer();
    } else {
      // El permís ha estat denegat
      setState(() {
        _status = 'Permís denegat. Cal el permís d\'Activitat Física.';
      });
    }
  }

  // Inicia la subscripció al flux de dades del podòmetre
  void _initPedometer() {
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onStepCount, onError: _onStepCountError);

    // Opcional: Per comprovar si estàs caminant o aturat (PedestrianStatus)
    Pedometer.pedestrianStatusStream.listen(_onPedestrianStatus, onError: _onPedestrianStatusError);
  }

  // Funció cridada cada vegada que hi ha una nova lectura de passos
  void _onStepCount(StepCount event) {
    print('Passos: ${event.steps}');
    setState(() {
      _steps = event.steps.toString();
    });
  }

  // Funció cridada si hi ha un error en la lectura de passos
  void _onStepCountError(error) {
    print('Error en StepCount Stream: $error');
    setState(() {
      _steps = 'N/D';
      _status = 'Error: No hi ha sensor o permís denegat.';
    });
  }

  // Funció cridada cada vegada que l'estat del vianant canvia
  void _onPedestrianStatus(PedestrianStatus event) {
    print('Estat: ${event.status}');
    setState(() {
      // Traducció simple per a l'usuari
      if (event.status == 'walking') {
        _status = 'Caminant';
      } else if (event.status == 'stopped') {
        _status = 'Aturat';
      } else {
        _status = 'Desconegut';
      }
    });
  }

  // Funció cridada si hi ha un error en l'estat
  void _onPedestrianStatusError(error) {
    print('Error en PedestrianStatus Stream: $error');
    setState(() {
      _status = 'No disponible';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Podòmetre en Temps Real'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Passos totals avui:',
              style: TextStyle(fontSize: 25, color: Colors.grey),
            ),
            Text(
              _steps,
              style: const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 50, thickness: 0),
            const Text(
              'Estat de l\'activitat:',
              style: TextStyle(fontSize: 25, color: Colors.grey),
            ),
            Icon(
              _status == 'Caminant'
                  ? Icons.directions_walk
                  : Icons.auto_awesome,
              size: 50,
              color: _status == 'Caminant' ? Colors.green : Colors.red,
            ),
            Text(
              _status,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}