import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(pais_uni_page());
}

class pais_uni_page extends StatefulWidget {
  @override
  _pais_uni_pageState createState() => _pais_uni_pageState();
}

class _pais_uni_pageState extends State<pais_uni_page> {
  String _nombrePais = '';
  List<Universidad> _universidades = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pais Universidad',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pais Universidad'),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          color: Colors.grey[300],
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Ingresa el nombre del país',
                ),
                onChanged: (value) {
                  setState(() {
                    _nombrePais = value;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _buscarUniversidades();
                },
                child: Text('Buscar Universidades'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                ),
              ),
              SizedBox(height: 20),
              if (_universidades.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: _universidades.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_universidades[index].nombre),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Dominio: ${_universidades[index].dominio}'),
                            Text('Enlace: ${_universidades[index].enlace}'),
                          ],
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _buscarUniversidades() async {
    if (_nombrePais.isNotEmpty) {
      String url = 'http://universities.hipolabs.com/search?country=$_nombrePais';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<Universidad> universidades = [];

        for (var uni in data) {
          universidades.add(Universidad(
            nombre: uni['name'],
            dominio: uni['domains'][0] ?? 'No disponible',
            enlace: uni['web_pages'][0] ?? 'No disponible',
          ));
        }

        setState(() {
          _universidades = universidades;
        });
      } else {
        print('Error en la solicitud HTTP');
      }
    }
  }
}

class Universidad {
  final String nombre;
  final String dominio;
  final String enlace;

  Universidad({
    required this.nombre,
    required this.dominio,
    required this.enlace,
  });
}
