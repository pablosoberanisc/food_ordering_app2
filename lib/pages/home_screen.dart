import 'package:flutter/material.dart'; // Importa las herramientas principales de Flutter.

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key}); // Define un widget con estado para la pantalla principal.

  @override
  State<HomeScreen> createState() => _HomeScreenState(); // Asocia un estado al widget.
}

class _HomeScreenState extends State<HomeScreen> {
  int totalItems = 0; // Número total de productos en el carrito.
  double totalPrice = 0.0; // Precio total de los productos.
  bool isPizzaFavorite = false; // Estado del ícono favorito para la pizza.
  bool isTacosFavorite = false; // Estado del ícono favorito para los tacos.

  // Método para agregar un producto al carrito.
  void addItem(double price) {
    setState(() {
      totalItems++; // Incrementa el contador de productos.
      totalPrice += price; // Suma el precio del producto al total.
    });
  }

  // Cambia el estado del ícono favorito para pizza.
  void togglePizzaFavorite() {
    setState(() {
      isPizzaFavorite = !isPizzaFavorite; // Alterna entre favorito y no favorito.
    });
  }

  // Cambia el estado del ícono favorito para tacos.
  void toggleTacosFavorite() {
    setState(() {
      isTacosFavorite = !isTacosFavorite; // Alterna entre favorito y no favorito.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 70.0, left: 50.0, right: 50), // Margen para separar el contenido del borde.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinea los widgets al inicio de la columna.
          children: [
            // Cabecera con íconos de menú y búsqueda.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Separa los íconos en extremos opuestos.
              children: const [
                Icon(Icons.menu, size: 40.0), // Ícono de menú.
                Icon(Icons.search, size: 35.0), // Ícono de búsqueda.
              ],
            ),
            const SizedBox(height: 20.0), // Espaciado vertical.
            Row(
              children: const [
                Text(
                  "SinDelantal", // Título de la aplicación.
                  style: TextStyle(color: Colors.black, fontFamily: "PoppinsMedium", fontSize: 24.0),
                ),
                Icon(Icons.arrow_drop_down, size: 50.0), // Ícono de menú desplegable.
              ],
            ),
            const Text(
              "Ordena lo que más se te antoje", // Descripción breve.
              style: TextStyle(color: Colors.black, fontFamily: "PoppinsMedium", fontSize: 17.0),
            ),
            const SizedBox(height: 20.0), // Espaciado vertical.
            // Sección de productos.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Separa los productos.
              children: [
                Flexible(
                  child: productCard(
                    "Pizza", // Nombre del producto.
                    "images/pizza.jpg", // Ruta de la imagen.
                    20.0, // Precio del producto.
                    isPizzaFavorite, // Estado del ícono favorito.
                    togglePizzaFavorite, // Acción para alternar favorito.
                    () => addItem(20.0), // Acción para agregar al carrito.
                  ),
                ),
                const SizedBox(width: 10), // Espaciado entre los productos.
                Flexible(
                  child: productCard(
                    "Tacos al Pastor", // Nombre del producto.
                    "images/tacos_pastor.jpg", // Ruta de la imagen.
                    15.0, // Precio del producto.
                    isTacosFavorite, // Estado del ícono favorito.
                    toggleTacosFavorite, // Acción para alternar favorito.
                    () => addItem(15.0), // Acción para agregar al carrito.
                  ),
                ),
              ],
            ),
            const Spacer(), // Empuja el carrito al final de la columna.
            // Sección del carrito.
            Container(
              margin: const EdgeInsets.only(bottom: 40.0), // Espaciado inferior.
              padding: const EdgeInsets.only(left: 30.0, right: 30.0), // Relleno lateral.
              height: 60, // Altura del contenedor.
              width: MediaQuery.of(context).size.width, // Ancho de toda la pantalla.
              decoration: const BoxDecoration(
                color: Color(0xff66D678), // Color de fondo del carrito.
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espacia los textos del carrito.
                children: [
                  Text(
                    "$totalItems items", // Muestra la cantidad total de productos.
                    style: const TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 20.0),
                  ),
                  Text(
                    "\$$totalPrice", // Muestra el precio total.
                    style: const TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget reutilizable para las tarjetas de producto.
  Widget productCard(String name, String imagePath, double price, bool isFavorite, VoidCallback onFavoriteTap, VoidCallback onAddTap) {
    return Container(
      padding: const EdgeInsets.all(15), // Relleno interno.
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffC5C5C5)), // Borde gris claro.
        borderRadius: BorderRadius.circular(10), // Bordes redondeados.
      ),
      width: MediaQuery.of(context).size.width / 2.6, // Ancho proporcional al tamaño de la pantalla.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Alinea el contenido al inicio.
        children: [
          // Ícono de favorito.
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // Alinea el ícono al extremo derecho.
            children: [
              GestureDetector(
                onTap: onFavoriteTap, // Acción al presionar el ícono.
                child: Icon(
                  Icons.favorite,
                  color: isFavorite ? const Color(0xffFB0000) : const Color(0xffCEC7C7), // Cambia el color según el estado.
                  size: 35.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0), // Espaciado.
          // Imagen del producto.
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150), // Imagen circular.
              child: Image.asset(
                imagePath,
                height: 150,
                width: 150,
                fit: BoxFit.cover, // Ajusta la imagen al contenedor.
              ),
            ),
          ),
          const SizedBox(height: 5.0), // Espaciado.
          Text(
            name, // Nombre del producto.
            style: const TextStyle(color: Colors.black, fontFamily: "Poppins", fontSize: 20.0),
          ),
          // Precio y botón de agregar.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Separa el precio del botón.
            children: [
              Text(
                "\$$price", // Precio del producto.
                style: const TextStyle(color: Color(0xff66D678), fontFamily: "Poppins", fontSize: 20.0),
              ),
              GestureDetector(
                onTap: onAddTap, // Acción al presionar el botón de agregar.
                child: Container(
                  padding: const EdgeInsets.all(3), // Relleno del contenedor.
                  decoration: BoxDecoration(
                    color: const Color(0xff66D678), // Fondo verde.
                    borderRadius: BorderRadius.circular(30), // Bordes redondeados.
                  ),
                  child: const Icon(Icons.add, color: Colors.white), // Ícono de agregar.
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
