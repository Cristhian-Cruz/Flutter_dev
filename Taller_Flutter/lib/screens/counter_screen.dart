import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:widgets/widget/globlal_drawer_view.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  _ContadorScreenState createState() => _ContadorScreenState();
}

class _ContadorScreenState extends State<CounterScreen> {
  int _contador = 0;
  Timer? _timer;
  bool _isRunning = false;

  void _iniciarContador() {
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _contador++;
      });
    });
  }

  void _pausarContador() {
    _timer?.cancel();
    _isRunning = false;
  }

  void _reiniciarContador() {
    _pausarContador();
    setState(() {
      _contador = 0;
    });
    _iniciarContador();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador Automático'),
        /*leading:
            Navigator.of(context).canPop()
                ? IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    context.pop(); // Regresa a la pantalla anterior
                  },
                )
                : null,*/
      ),
      drawer: const GlobalDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$_contador',
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _iniciarContador,
                  child: const Text('Iniciar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _pausarContador,
                  child: const Text('Pausar'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _reiniciarContador,
                  child: const Text('Reiniciar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
