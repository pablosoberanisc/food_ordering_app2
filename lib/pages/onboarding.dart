import 'package:flutter/material.dart'; // Importa las herramientas necesarias de Flutter.
import 'package:food_ordering_app2/pages/home_screen.dart'; // Importa la pantalla HomeScreen.

/// Clase principal que representa la pantalla de bienvenida.
class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3F0), // Define el color de fondo suave.
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // **Punto clave**: Centra los elementos verticalmente.
          children: [
            // Imagen de portada.
            Image.asset(
              "images/portada.png", // Ruta de la imagen de portada.
              height: MediaQuery.of(context).size.width / 1, // **Punto clave**: Usa MediaQuery para un diseño responsivo que ajusta la altura según el ancho de pantalla.
              width: MediaQuery.of(context).size.width / 2, // **Punto clave**: Usa MediaQuery para ajustar el ancho dinámicamente.
            ),
            const Text(
              "SinDelantal", // Título principal de la pantalla.
              style: TextStyle(
                color: Colors.black87, // Color del texto.
                fontSize: 30.0, // **Punto clave**: Define un tamaño de fuente grande para destacar el título.
                fontFamily: 'Poppins', // Familia tipográfica para estilo moderno.
              ),
            ),
            const SizedBox(height: 120.0), // Espaciado para separar los elementos visualmente.
            // Botón interactivo.
            GestureDetector(
              onTap: () {
                // **Punto clave**: Usa Navigator.push para navegar hacia la pantalla HomeScreen cuando se presiona el botón.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()), // Navegación hacia HomeScreen.
                );
              },
              child: Container(
                margin: const EdgeInsets.only(left: 20.0, right: 20.0), // **Punto clave**: Añade márgenes laterales para alinear el botón con el diseño general.
                height: 50, // Altura del botón.
                width: MediaQuery.of(context).size.width, // **Punto clave**: Usa MediaQuery para que el ancho del botón ocupe todo el espacio disponible.
                decoration: BoxDecoration(
                  color: const Color(0xFFE4080A), // **Punto clave**: Coloca un color rojo llamativo que atraiga la atención al botón.
                  borderRadius: BorderRadius.circular(30), // **Punto clave**: Bordes redondeados para un diseño moderno.
                ),
                child: const Center(
                  child: Text(
                    "Entrar", // Texto del botón.
                    style: TextStyle(
                      color: Color(0xFF333333), // **Punto clave**: Usa un color contrastante para destacar el texto sobre el fondo rojo.
                      fontSize: 20.0, // **Punto clave**: Tamaño de texto legible y prominente.
                      fontWeight: FontWeight.w500, // **Punto clave**: Usa una fuente semigruesa para dar peso visual al texto.
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
