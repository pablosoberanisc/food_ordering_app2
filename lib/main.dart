import 'package:flutter/material.dart'; // Importa las herramientas necesarias de Flutter para construir la interfaz.
import 'package:food_ordering_app2/pages/onboarding.dart'; // Importa la pantalla de Onboarding desde el proyecto.

void main() {
  runApp(const MyApp()); // Ejecuta la aplicación iniciando con el widget MyApp.
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Define un widget sin estado para la estructura principal de la aplicación.

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Crea la aplicación principal con configuración básica.
      title: 'Flutter Demo', // Establece el título de la aplicación.
      debugShowCheckedModeBanner: false, // Oculta el banner de "Debug" en la esquina superior derecha.
      theme: ThemeData( // Define el tema de la aplicación.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Genera un esquema de colores basado en un color semilla.
        useMaterial3: true, // Habilita el diseño basado en Material 3.
      ),
      home: const Onboarding(), // Establece la pantalla de inicio como Onboarding.
    );
  }
}

