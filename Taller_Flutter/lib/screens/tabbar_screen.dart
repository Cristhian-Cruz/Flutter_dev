import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets/widget/globlal_drawer_view.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Método que construye la interfaz de usuario
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Screen'),
        leading:
            Navigator.of(context).canPop()
                ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop(); // Regresa a la pantalla anterior
                  },
                )
                : null,
      ), // Título de la AppBar
      drawer: const GlobalDrawer(),
      backgroundColor: Colors.blue, // Color de fondo de la AppBar
      body: const Center(child: Text('¡Bienvenido al TabBar!')),
    );
  }
}
