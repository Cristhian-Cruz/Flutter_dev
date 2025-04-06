import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GlobalDrawer extends StatelessWidget {
  const GlobalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          _crearItemDrawer(
            context,
            Icons.home,
            'Inicio',
            () => GoRouter.of(context).push('/'),
          ),
          _crearItemDrawer(
            context,
            Icons.grid_view,
            'GridView',
            () => GoRouter.of(context).push('/gridview'),
          ),
          /*_crearItemDrawer(
            context,
            Icons.tab,
            'TabBar',
            () => GoRouter.of(context).push('/tabbar'),
          ),*/
          _crearItemDrawer(context, Icons.info, 'Detalle con mensaje', () {
            String mensaje = "Hola desde el Drawer";
            GoRouter.of(context).go('/detail/$mensaje');
          }),
          _crearItemDrawer(
            context,
            Icons.list,
            'Lista de nombres',
            () => GoRouter.of(context).push('/listview'),
          ),
          _crearItemDrawer(
            context,
            Icons.timer,
            'Contador',
            () => GoRouter.of(context).push('/contador'),
          ),
          _crearItemDrawer(
            context,
            Icons.timer,
            'Tarea Pesada',
            () => GoRouter.of(context).push('/tarea_pesada'),
          ),
          _crearItemDrawer(
            context,
            Icons.list,
            'Listado',
            () => GoRouter.of(context).push('/listado'),
          ),
          // Agregamos el item para el listado
        ],
      ),
    );
  }

  Widget _crearItemDrawer(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }
}
