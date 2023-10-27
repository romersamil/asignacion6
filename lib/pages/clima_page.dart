import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(clima_page());
}

class clima_page extends StatefulWidget {
  @override
  _clima_pageState createState() => _clima_pageState();
}

class _clima_pageState extends State<clima_page> {
  final String apiKey = 'f5c7c4d36bf8845231db4d1299603744'; // Reemplaza con tu propia clave de OpenWeatherMap
  String ciudad = 'Santo Domingo';
  String temperatura = '';
  String descripcion = '';

  @override
  void initState() {
    super.initState();
    _obtenerClima();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CLIMA'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[300],
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ciudad: $ciudad',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'Temperatura: $temperatura',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Descripción: $descripcion',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _obtenerClima() async {
    final String url =
        'http://api.openweathermap.org/data/2.5/weather?q=$ciudad&appid=$apiKey&units=metric';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        setState(() {
          temperatura = '${data['main']['temp']} °C';
          descripcion = data['weather'][0]['description'];
        });
      } else {
        print('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
