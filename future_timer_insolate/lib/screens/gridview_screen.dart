import 'package:flutter/material.dart';
import '../widget/grid_view.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView')),
      body: CustomGridView(),
    );
  }
}
