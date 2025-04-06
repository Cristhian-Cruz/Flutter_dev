import 'package:flutter/material.dart';
//import 'package:go_router/go_router.dart';
import 'dart:isolate';
import 'dart:async';

import 'package:widgets/widget/globlal_drawer_view.dart';

class TareaPesadaScreen extends StatefulWidget {
  const TareaPesadaScreen({super.key});

  @override
  _TareaPesadaScreenState createState() => _TareaPesadaScreenState();
}

class _TareaPesadaScreenState extends State<TareaPesadaScreen> {
  bool isLoading = false;

  // Función que realiza la tarea pesada
  static int tareaPesada(int start, int end) {
    print('Iniciando tarea pesada...');
    int suma = 0;
    for (int i = start; i <= end; i++) {
      suma += i;
    }
    print('Tarea pesada completada');
    return suma;
  }

  // Función que maneja la ejecución del isolate
  Future<void> ejecutarTareaPesada() async {
    setState(() {
      isLoading = true;
    });

    final receivePort = ReceivePort();
    print('Creando el Isolate...');
    await Isolate.spawn(_ejecutarEnIsolate, receivePort.sendPort);

    // Esperar a recibir el resultado del isolate
    final sendPort = await receivePort.first as SendPort;
    final resultPort = ReceivePort();
    print('Enviando mensaje al Isolate...');
    sendPort.send([
      resultPort.sendPort,
      1,
      2000000,
    ]); // Pasamos la tarea a realizar (sumar de 1 a 2 millones)

    // Esperar el resultado de la tarea
    final resultado = await resultPort.first;

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Resultado de la tarea: $resultado')),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  static void _ejecutarEnIsolate(SendPort sendPort) {
    final port = ReceivePort();
    sendPort.send(port.sendPort);
    print('Isolate está escuchando...');
    port.listen((message) {
      print('Isolate recibió mensaje: $message');
      final send = message[0] as SendPort;
      final start = message[1] as int;
      final end = message[2] as int;

      final resultado = tareaPesada(start, end);
      print('Isolate enviando resultado: $resultado');
      send.send(resultado);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea Pesada'),
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
        child:
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                  onPressed: ejecutarTareaPesada,
                  child: Text('Ejecutar Tarea Pesada'),
                ),
      ),
    );
  }
}
