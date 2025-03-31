import 'package:go_router/go_router.dart';
import 'package:widgets/main.dart';
import 'package:widgets/screens/tabbar_screen.dart';
import 'screens/gridview_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    // Ruta de la página principal
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(title: 'Inicio'),
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
  ],
);
