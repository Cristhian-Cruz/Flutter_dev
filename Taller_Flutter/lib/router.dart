import 'package:go_router/go_router.dart';
import 'package:widgets/main.dart';
import 'package:widgets/screens/tabbar_screen.dart';
import 'screens/gridview_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/list_view_screen.dart';
import 'screens/counter_screen.dart';
import 'screens/tarea_pesada_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    // Ruta de la página principal
    GoRoute(
      path: '/',
      builder: (context, state) => MyHomePage(title: 'Inicio'),
    ),
    // Ruta para la pantalla TabBar
    GoRoute(path: '/tabbar', builder: (context, state) => const TabBarScreen()),
    // Ruta para el GridView
    GoRoute(
      path: '/gridview',
      builder:
          (context, state) =>
              const GridViewScreen(), // Pantalla donde se muestra el GridView
    ),
    // Ruta para la pantalla de detalles
    GoRoute(
      path: '/detail/:message',
      // Aquí definimos la ruta con un parámetro 'message'
      builder: (context, state) {
        final message =
            state.pathParameters['message'] ??
            'Sin mensaje'; // Obtenemos el mensaje de los parámetros de la ruta
        return DetailScreen(
          message: message,
        ); // Pantalla de detalles que recibe el mensaje
      },
    ),
    // Ruta para la lista de estudiantes
    GoRoute(
      path: '/listview',
      builder:
          (context, state) =>
              const ListViewScreen(), // Pantalla donde se muestra la lista de estudiantes
    ),
    GoRoute(
      path: '/contador',
      builder: (context, state) => const CounterScreen(),
    ),
    GoRoute(
      path: '/tarea_pesada',
      builder: (context, state) => const TareaPesadaScreen(),
    ),
  ],
);
