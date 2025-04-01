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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Menú de Navegación',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                GoRouter.of(context).go('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.grid_view),
              title: const Text('GridView'),
              onTap: () {
                GoRouter.of(context).go('/gridview');
              },
            ),
            ListTile(
              leading: const Icon(Icons.tab),
              title: const Text('TabBar'),
              onTap: () {
                GoRouter.of(context).go('/tabbar');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Detalle con mensaje'),
              onTap: () {
                String mensaje = "Hola desde el Drawer";
                GoRouter.of(context).go('/detail/$mensaje');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/tabbar');
              },
              child: const Text('Ir a TabBar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/gridview');
              },
              child: const Text('Ir a GridView'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String mensaje = "Hola desde MyHomePage";
                GoRouter.of(context).go('/detail/$mensaje');
              },
              child: const Text('Ir a Detalle con mensaje'),
            ),
          ],
        ),
      ),
    );
  }
}
