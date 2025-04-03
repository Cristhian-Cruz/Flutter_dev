import 'package:flutter/material.dart';

class CustomGridView extends StatelessWidget {
  // Clase que representa una cuadrícula personalizada
  CustomGridView({super.key});

  /// Constructor de la clase CustomGridView
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];
  // Lista de elementos que se mostrarán en la cuadrícula
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // Configuración de la cuadrícula
        crossAxisCount: 2, // Número de columnas
        crossAxisSpacing: 2, // Espacio entre columnas
        mainAxisSpacing: 2, // Espacio entre filas
        //
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[100 * ((index % 9) + 1)],
          child: Center(
            child: Text(
              items[index], // Ahora usa la lista correctamente
              style: Theme.of(context).textTheme.headlineSmall,
              // Estilo del texto
            ),
          ),
        );
      },
    );
  }
}
