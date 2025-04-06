import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router.dart';
//import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Dev',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 12),
          headlineMedium: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title; // Widget hijo que se pasará al constructor

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // Índice actual de la pestaña

  final List<String> _routes = [
    '/',
    '/gridview',
    //'/tabbar',
    '/detail/Hola%20desde%20TabBar',
    '/listview',
    '/contador',
    '/tarea_pesada',
    '/listado',
    // Agregamos la ruta para el listado
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    GoRouter.of(context).go(_routes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex > 0) {
          setState(() {
            _selectedIndex = 0;
          });
          GoRouter.of(context).go('/');
          return false; // Evita que la app se cierre
        }
        return true; // Permite salir si está en la página de inicio
      },
      child: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            leading:
                _selectedIndex > 0
                    ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 0;
                        });
                        GoRouter.of(context).go('/');
                      },
                    )
                    : null,
            bottom: TabBar(
              isScrollable: true,
              onTap: _onTabTapped,
              tabs: const [
                Tab(icon: Icon(Icons.home), text: 'Inicio'),
                Tab(icon: Icon(Icons.grid_view), text: 'GridView'),
                Tab(icon: Icon(Icons.info), text: 'Detalle'),
                Tab(icon: Icon(Icons.list), text: 'Lista'),
                Tab(icon: Icon(Icons.timer), text: 'Contador'),
                Tab(icon: Icon(Icons.work), text: 'Tarea Pesada'),
                Tab(icon: Icon(Icons.list), text: 'Listado'),
                // Agregamos la pestaña para el listado
              ],
            ),
          ),
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
                _crearItemDrawer(Icons.home, 'Inicio', 0),
                _crearItemDrawer(Icons.grid_view, 'GridView', 1),
                _crearItemDrawer(Icons.info, 'Detalle con mensaje', 2),
                _crearItemDrawer(Icons.list, 'Lista de nombres', 3),
                _crearItemDrawer(Icons.timer, 'Contador', 4),
                _crearItemDrawer(Icons.work, 'Tarea Pesada', 5),
                _crearItemDrawer(Icons.list, 'Listado', 6),
                // Agregamos el item para el listado
              ],
            ),
          ),
          body: Center(child: Text('Bienvenido a Flutter')),
        ),
      ),
    );
  }

  Widget _crearItemDrawer(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        GoRouter.of(context).go(_routes[index]);
        Navigator.pop(context);
      },
    );
  }
}
