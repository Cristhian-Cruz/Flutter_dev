import 'package:flutter/material.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TabBar Screen')),
      body: const Center(child: Text('¡Bienvenido al TabBar!')),
    );
  }
}
