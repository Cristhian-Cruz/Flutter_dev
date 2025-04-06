import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'package:widgets/widget/globlal_drawer_view.dart';
import '../widget/grid_view.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridView'),
        /*leading:
            Navigator.of(context).canPop()
                ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop(); // Regresa a la pantalla anterior
                  },
                )
                : null,*/
      ),
      drawer: const GlobalDrawer(), // Título de la AppBar
      backgroundColor: Colors.blue, // Color de fondo de la AppBar
      body:
          CustomGridView(), // Llama al widget CustomGridView que contiene la cuadrícula
    );
  }
}
