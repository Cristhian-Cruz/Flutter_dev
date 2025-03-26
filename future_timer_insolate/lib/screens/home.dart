import 'package:flutter/material.dart';
import '../widget/grid_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Future Timer Isolate')),
      body: CustomGridView(),
    );
  }
}
