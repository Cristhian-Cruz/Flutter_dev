import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router.dart';

void main() {
  // Función principal que inicia la aplicación
  runApp(const MyApp()); // Llama a la clase MyApp
}

class MyApp extends StatelessWidget {
  // Clase principal de la aplicación
  // Constructor de la clase MyApp
  const MyApp({super.key});

  // This widget is the root of your application.
  @override // Método que construye el widget
  Widget build(BuildContext context) {
    // Método build que devuelve el widget
    // Devolvemos el MaterialApp.router con la configuración del router
    return MaterialApp.router(
      title: 'Flutter Dev', // Título de la aplicación
      routerConfig: router, // Aquí asignamos el router a la aplicación
      theme: ThemeData(
        // Tema de la aplicación
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
        ), // ColorScheme que define los colores de la aplicación
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 12),
          headlineMedium: TextStyle(fontSize: 24),
        ),
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// Esta clase representa la pantalla principal de la aplicación
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  }); // Constructor de la clase MyHomePage
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // Método que crea el estado de la clase MyHomePage
}

class _MyHomePageState extends State<MyHomePage> {
  // Este método se llama una sola vez cuando el widget es creado.
  @override
  void initState() {
    super.initState();
    // Imprimimos en consola para evidenciar que se ha ejecutado initState
    print("initState() ejecutado");
  }

  // Este método se llama cuando las dependencias del widget cambian.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Imprimimos en consola para evidenciar que se ha ejecutado didChangeDependencies
    print("didChangeDependencies() ejecutado");
  }

  // Este método es responsable de construir la interfaz de usuario.
  @override
  Widget build(BuildContext context) {
    // Imprimimos en consola cada vez que el widget necesita ser reconstruido.
    print("build() ejecutado");

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
            // Elementos del Drawer para navegar entre las diferentes pantallas.
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
            // Botón para navegar hacia la pantalla TabBar.
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/tabbar');
                // Imprimimos que se ha presionado el botón
                print("Botón 'Ir a TabBar' presionado");
              },
              child: const Text('Ir a TabBar'),
            ),
            const SizedBox(height: 20),
            // Botón para navegar hacia la pantalla GridView.
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/gridview');
                // Imprimimos que se ha presionado el botón
                print("Botón 'Ir a GridView' presionado");
              },
              child: const Text('Ir a GridView'),
            ),
            const SizedBox(height: 20),
            // Botón para navegar hacia la pantalla de Detalles con mensaje.
            ElevatedButton(
              onPressed: () {
                String mensaje = "Hola desde MyHomePage";
                GoRouter.of(context).go('/detail/$mensaje');
                // Imprimimos que se ha presionado el botón
                print("Botón 'Ir a Detalle con mensaje' presionado");
              },
              child: const Text('Ir a Detalle con mensaje'),
            ),
          ],
        ),
      ),
    );
  }

  // Este método se llama cada vez que el estado del widget cambia.
  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    // Imprimimos en consola para evidenciar que se ha ejecutado setState
    print("setState() ejecutado");
  }

  // Este método se llama cuando el widget se destruye o se elimina.
  @override
  void dispose() {
    // Imprimimos en consola para evidenciar que se ha ejecutado dispose
    print("dispose() ejecutado");
    super.dispose();
  }
}
