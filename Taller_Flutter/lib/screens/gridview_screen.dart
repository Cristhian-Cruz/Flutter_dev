import 'package:flutter/material.dart';
import '../widget/grid_view.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView')), // Título de la AppBar
      backgroundColor: Colors.blue, // Color de fondo de la AppBar
      body:
          CustomGridView(), // Llama al widget CustomGridView que contiene la cuadrícula
    );
  }
}
