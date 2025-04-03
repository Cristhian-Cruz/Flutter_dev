import 'package:go_router/go_router.dart';
import 'screens/home.dart';

final GoRouter router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => Home())],
);
