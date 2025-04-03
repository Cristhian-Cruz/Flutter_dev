import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String message; // Mensaje que se recibe al navegar a esta pantalla

  const DetailScreen({
    super.key,
    required this.message,
  }); // Constructor que recibe el mensaje

  @override
  Widget build(BuildContext context) {
    // Método que construye la interfaz de usuario
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Detalles'), // Título de la AppBar
        backgroundColor: Colors.blue, // Color de fondo de la AppBar
      ), // Título de la AppBar
      body: Center(
        child: Text(
          'Mensaje recibido: $message',
          style: const TextStyle(fontSize: 19), // Muestra el mensaje recibido
        ),
      ),
    );
  }
}
