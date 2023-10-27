import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(nombre_genero_page());
}

class nombre_genero_page extends StatefulWidget {
  @override
  _nombre_genero_pageState createState() => _nombre_genero_pageState();
}

class _nombre_genero_pageState extends State<nombre_genero_page> {
  String _nombre = '';
  late Uri _url;
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Predecir Género',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prediccion de genero'),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          color: Colors.grey[300], // Fondo gris claro
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Ingresa un nombre',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _nombre = value;
                      _url = Uri.parse('https://api.genderize.io/?name=${_nombre}');
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _predictNombreGenero();
                  },
                  child: Text('Predecir Género'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal), // Cambia el color del botón
                  ),
                ),
                SizedBox(height: 20),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  width: _color == Colors.blue ? 200 : 100,
                  height: _color == Colors.blue ? 200 : 100,
                  color: _color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _predictNombreGenero() async {
    if (_url != null) {
      try {
        final response = await http.get(_url);

        if (response.statusCode == 200) {
          final json = jsonDecode(response.body);
          final gender = json['gender'];

          setState(() {
            _color = gender == 'male' ? Colors.blue : Colors.pink;
          });
        } else {
          print('Error en la solicitud HTTP: ${response.statusCode}');
        }
      } catch (error) {
        print('Error: $error');
      }
    }
  }
}
