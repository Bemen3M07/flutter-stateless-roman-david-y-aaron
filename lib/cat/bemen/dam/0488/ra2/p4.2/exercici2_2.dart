import 'package:flutter/material.dart'; // Importa las herramientas visuales de Flutter

void main() {
  // Ejecuta la aplicación usando directamente MaterialApp con la pantalla principal
  runApp(const MaterialApp(home: SayHelloApp()));
}

// ---------------------------------------------------------------------------
// 1. SayHelloApp: Widget con estado (StatefulWidget)
// ---------------------------------------------------------------------------
class SayHelloApp extends StatefulWidget {
  const SayHelloApp({super.key});

  @override
  State<SayHelloApp> createState() => _SayHelloAppState();
}

// ---------------------------------------------------------------------------
// 2. Clase que maneja el estado del widget
// ---------------------------------------------------------------------------
class _SayHelloAppState extends State<SayHelloApp> {

  // Controlador para leer el texto introducido en el TextField
  final TextEditingController _controller = TextEditingController();

  // Función que muestra un diálogo emergente al presionar el botón
  void _showDialog(BuildContext context) {
    String name = _controller.text.trim(); // Obtiene el nombre sin espacios extra

    // Si está vacío, muestra "HELLO !"; si no, incluye el nombre
    String greeting = name.isEmpty ? "HELLO !" : "HELLO $name";

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text(
          greeting, // Mensaje a mostrar en el diálogo
          style: const TextStyle(
            fontSize: 24, // Tamaño grande de letra
            fontWeight: FontWeight.bold, // Negrita
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera memoria del controlador al cerrar el widget
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // 3. Construcción de la interfaz gráfica
  // ---------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estructura visual principal de la pantalla
      body: Center( // Centra todo el contenido en pantalla
        child: Padding(
          padding: const EdgeInsets.all(40.0), // Márgenes de 40 px alrededor
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
            crossAxisAlignment: CrossAxisAlignment.center, // Centrado horizontal
            children: <Widget>[

              // Campo de entrada de texto para escribir el nombre
              SizedBox(
                width: 300, // Limita el ancho del campo de texto
                child: TextField(
                  controller: _controller, // Conecta el campo con el controlador
                  decoration: const InputDecoration(
                    labelText: 'Name', // Etiqueta flotante
                    border: OutlineInputBorder(), // Borde rectangular visible
                  ),
                ),
              ),

              const SizedBox(height: 30), // Espacio vertical entre widgets

              // Botón para ejecutar el saludo
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800, // Color del botón
                  foregroundColor: Colors.white, // Color del texto del botón
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ), // Tamaño interno del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Botón redondeado
                  ),
                ),
                onPressed: () => _showDialog(context), // Acción del botón
                child: const Text(
                  'SayHello',
                  style: TextStyle(fontSize: 18), // Tamaño del texto del botón
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
