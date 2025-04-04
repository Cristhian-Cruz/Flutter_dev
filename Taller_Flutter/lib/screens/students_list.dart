import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import 'package:widgets/widget/globlal_drawer_view.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  Future<List<String>> _fetchStudents() async {
    return Future.delayed(
      const Duration(seconds: 2),
      () => ["Juan", "María", "Pedro", "Ana", "Carlos", "Sofía"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Estudiantes'),
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
      drawer: const GlobalDrawer(),
      body: FutureBuilder<List<String>>(
        future: _fetchStudents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar datos'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay estudiantes'));
          }

          final students = snapshot.data!;
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.person),
                title: Text(students[index]),
              );
            },
          );
        },
      ),
    );
  }
}
