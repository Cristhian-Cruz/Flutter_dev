import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Devolvemos el MaterialApp.router con la configuración del router
    return MaterialApp.router(
      title: 'Flutter Dev', // Título de la aplicación
      routerConfig: router, // Aquí asignamos el router a la aplicación
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 12),
          headlineMedium: TextStyle(fontSize: 24),
        ),
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Primer botón: Navegar a la pantalla TabBar
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/tabbar'); // Navega a TabBarScreen
              },
              child: const Text('Ir a TabBar'),
            ),
            const SizedBox(height: 20), // Espacio entre los botones
            // Segundo botón: Navegar a la pantalla con el GridView
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/gridview'); // Navega a GridViewScreen
              },
              child: const Text('Ir a GridView'),
            ),
          ],
        ),
      ),
    );
  }
}
