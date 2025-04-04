import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/widget/globlal_drawer_view.dart';

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
        backgroundColor: Colors.blue,
        leading:
            Navigator.of(context).canPop()
                ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop(); // Regresa a la pantalla anterior
                  },
                )
                : null, // Color de fondo de la AppBar
      ),
      drawer: const GlobalDrawer(), // Título de la AppBar
      body: Center(
        child: Text(
          'Mensaje recibido: $message',
          style: const TextStyle(fontSize: 19), // Muestra el mensaje recibido
        ),
      ),
    );
  }
}
