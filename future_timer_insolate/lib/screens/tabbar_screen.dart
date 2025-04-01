import 'package:flutter/material.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Método que construye la interfaz de usuario
    return Scaffold(
      appBar: AppBar(title: const Text('TabBar Screen')), // Título de la AppBar
      backgroundColor: Colors.blue, // Color de fondo de la AppBar
      body: const Center(child: Text('¡Bienvenido al TabBar!')),
    );
  }
}
