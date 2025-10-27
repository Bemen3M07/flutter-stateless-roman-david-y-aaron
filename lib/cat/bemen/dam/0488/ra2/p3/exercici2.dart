// Importa el paquete principal de Flutter que contiene widgets y utilidades
import 'package:flutter/material.dart'; 

// Función principal que ejecuta la app
void main() {
  runApp(MyApp()); // Ejecuta la aplicación, iniciando con el widget MyApp
}

// Widget principal de la aplicación, sin estado (StatelessWidget)
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la etiqueta de "debug" en la esquina
      title: 'Welcome App', // Título de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blue, // Define el color principal de la app
      ),
      home: WelcomeScreen(), // Pantalla principal que se muestra al iniciar
    );
  }
}

// Pantalla de bienvenida
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ancho personalizado de los botones
    double buttonWidth = 250;

    return Scaffold(
      body: Center( // Centra el contenido en la pantalla
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Espaciado interno alrededor del contenido
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centra los elementos verticalmente
            children: [
              Text(
                'Welcome!', // Texto principal de bienvenida
                style: TextStyle(
                  fontSize: 28, // Tamaño del texto
                  fontWeight: FontWeight.bold, // Texto en negrita
                ),
              ),
              SizedBox(height: 8), // Espacio vertical de 8 píxeles
              Text(
                'Start learning now', // Texto secundario
                style: TextStyle(
                  fontSize: 18, // Tamaño del texto
                  color: Colors.grey[700], // Color gris para el texto
                ),
              ),
              SizedBox(height: 40), // Espacio vertical de 40 píxeles antes de los botones

              // Botón Login con texto blanco
              SizedBox(
                width: buttonWidth,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Acción al presionar Login
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, // Color del texto
                    backgroundColor: Colors.blue[700], // Color del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Login'),
                ),
              ),
              SizedBox(height: 16), // Espacio entre los botones

              // Botón Register con texto blanco
              SizedBox(
                width: buttonWidth,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Acción al presionar Register
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, // Color del texto
                    backgroundColor: Colors.blue[700], // Color del botón
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
