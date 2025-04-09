import 'package:flutter/material.dart';
import 'dart:async';
import 'package:widgets/widget/globlal_drawer_view.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<String> nombres = [];

  @override
  void initState() {
    super.initState();
    _cargarNombres();
  }

  Future<void> _cargarNombres() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      nombres = ['Juan', 'María', 'Carlos', 'Ana', 'Luis'];
    });
  }

  void _mostrarDialogoAgregar() {
    TextEditingController controlador = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Agregar Nombre'),
            content: TextField(
              controller: controlador,
              decoration: const InputDecoration(hintText: 'Ingrese un nombre'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  final nombre = controlador.text.trim();
                  if (nombre.isNotEmpty) {
                    setState(() => nombres.add(nombre));
                  }
                  Navigator.pop(context);
                },
                child: const Text('Agregar'),
              ),
            ],
          ),
    );
  }

  void _mostrarDialogoEditar(int index) {
    TextEditingController controlador = TextEditingController(
      text: nombres[index],
    );

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Editar Nombre'),
            content: TextField(
              controller: controlador,
              decoration: const InputDecoration(hintText: 'Nuevo nombre'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  final nuevoNombre = controlador.text.trim();
                  if (nuevoNombre.isNotEmpty) {
                    setState(() => nombres[index] = nuevoNombre);
                  }
                  Navigator.pop(context);
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
    );
  }

  void _eliminarNombre(int index) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text('Eliminar Nombre'),
            content: Text('¿Seguro que deseas eliminar a ${nombres[index]}?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() => nombres.removeAt(index));
                  Navigator.pop(context);
                },
                child: const Text('Eliminar'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Nombres')),
      drawer: const GlobalDrawer(),
      body:
          nombres.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: nombres.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(nombres[index]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _mostrarDialogoEditar(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _eliminarNombre(index),
                        ),
                      ],
                    ),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _mostrarDialogoAgregar,
        child: const Icon(Icons.add),
      ),
    );
  }
}
