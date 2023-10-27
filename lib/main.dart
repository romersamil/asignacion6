import 'package:flutter/material.dart';
import 'package:tarea6_romeramparo/pages/home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MI APP EN FLUTTER'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer:  home_page(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MI APP EN FLUTTER'),
      ),
      body: Center(

        child: Container(
          height: 300,
          width: 300,

          // Agregar color de fondo y bordes redondeados
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20), // Ajusta el radio según sea necesario
          ),
          padding: const EdgeInsets.all(16.0), // Ajusta el espacio interno según sea necesario
          child: Center(
            child: Image.asset(
              'assets/tools.jpg',
              width: 250, // Tamaño ligeramente mayor que el de la imagen
              height: 250,
              fit: BoxFit.cover,

            ),
          ),
        ),
      ),
    );
  }
}
