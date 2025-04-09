import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:widgets/screens/detalle_screen.dart';
import 'package:widgets/widget/globlal_drawer_view.dart';

class ListadoScreen extends StatefulWidget {
  const ListadoScreen({super.key});

  @override
  State<ListadoScreen> createState() => _ListadoScreenState();
}

class _ListadoScreenState extends State<ListadoScreen> {
  List<dynamic> personajes = [];
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    obtenerPersonajes();
  }

  Future<void> obtenerPersonajes() async {
    try {
      final url = Uri.parse('https://rickandmortyapi.com/api/character');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          personajes = data['results'];
          isLoading = false;
        });
      } else {
        throw Exception('Error al cargar los personajes');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listado Rick and Morty')),
      drawer: GlobalDrawer(),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : hasError
              ? const Center(child: Text('Error al cargar los personajes'))
              : personajes.isEmpty
              ? const Center(child: Text('No hay personajes disponibles'))
              : ListView.builder(
                itemCount: personajes.length,
                itemBuilder: (context, index) {
                  final personaje = personajes[index];
                  return ListTile(
                    leading: Image.network(personaje['image']),
                    title: Text(personaje['name']),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetalleScreen(personaje: personaje),
                        ),
                      );
                    },
                  );
                },
              ),
    );
  }
}
