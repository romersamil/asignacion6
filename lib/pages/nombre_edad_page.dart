import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(nombre_edad_page());
}

class nombre_edad_page extends StatefulWidget {
  @override
  _nombre_edad_pageState createState() => _nombre_edad_pageState();
}

class _nombre_edad_pageState extends State<nombre_edad_page> {
  String _nombre = '';
  int _edad = 0;
  String _mensaje = '';
  String _imagen = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nombre Edad',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Edad Predictor'),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          color: Colors.grey[300],
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Ingresa tu nombre',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _nombre = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _predictEdad();
                  },
                  child: Text('Predecir Edad'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                  ),
                ),
                SizedBox(height: 20),
                if (_edad != 0)
                  Column(
                    children: [
                      Image.asset(
                        _imagen,
                        width: 200,
                        height: 200,
                      ),
                      SizedBox(height: 20),
                      Text(
                        _mensaje,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Edad: $_edad',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _predictEdad() async {
    var url = Uri.parse('https://api.agify.io/?name=${_nombre}').toString();
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      _edad = json['age'];

      switch (_edad) {
        case 0:
          _mensaje = 'No se pudo determinar la edad';
          _imagen = 'assets/images/no-image.png';
          break;
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
          _mensaje = 'Joven';
          _imagen = 'assets/joven.png';
          break;
        case 25:
        case 26:
        case 27:
        case 28:
        case 29:
        case 30:
        case 31:
        case 32:
        case 33:
          _mensaje = 'Adulto';
          _imagen = 'assets/adulto.png';
          break;
        default:
          _mensaje = 'Anciano';
          _imagen = 'assets/anciano.jpg';
          break;
      }

      setState(() {});
    }
  }
}
