import 'package:flutter/material.dart';



class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('MI APP EN FLUTTER'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Image.asset(
              'assets/tools.jpg',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
