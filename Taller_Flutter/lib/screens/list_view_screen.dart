import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import 'package:widgets/widget/globlal_drawer_view.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  Future<List<String>> _cargarNombres() async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () => [
        'Juan',
        'María',
        'Carlos',
        'Ana',
        'Luis',
      ], // Simulación de carga de datos
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Nombres'),
        leading:
            Navigator.of(context).canPop()
                ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop(); // Regresa a la pantalla anterior
                  },
                )
                : null,
      ),
      drawer: const GlobalDrawer(), // Título de la barra de la aplicación

      body: FutureBuilder<List<String>>(
        future: _cargarNombres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar los nombres'));
          } else {
            final nombres = snapshot.data!;
            return ListView.builder(
              itemCount: nombres.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(nombres[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
