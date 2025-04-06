import 'package:flutter/material.dart';

class DetalleScreen extends StatelessWidget {
  final Map<String, dynamic> personaje;

  const DetalleScreen({super.key, required this.personaje});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(personaje['name'])),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(personaje['image']),
                const SizedBox(height: 16),
                Text(
                  'Nombre: ${personaje['name']}',
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text('Especie: ${personaje['species']}'),
                Text('Estado: ${personaje['status']}'),
                Text('Género: ${personaje['gender']}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
