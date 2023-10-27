import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(noticias_page());
}

class noticias_page extends StatefulWidget {
  @override
  _noticias_pageState createState() => _noticias_pageState();
}

class _noticias_pageState extends State<noticias_page> {
  final String apiKey = '7b88f4a896dd4644b6b4c15e6abe8347'; // Reemplaza con tu clave de API de NewsAPI
  final String apiUrl = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=7b88f4a896dd4644b6b4c15e6abe8347'; // Reemplaza con tu clave de API

  late List<Noticia> noticias;

  @override
  void initState() {
    super.initState();
    _cargarNoticias();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noticias',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Noticias'),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          color: Colors.grey[300],
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Puedes agregar un widget para mostrar el logo de tu aplicación aquí
              SizedBox(height: 20),
              if (noticias.isNotEmpty)
                for (var noticia in noticias)
                  Column(
                    children: [
                      Text(
                        noticia.titulo,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(noticia.resumen),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => _abrirEnlace(noticia.enlace),
                        child: Text('Visitar'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }

  void _cargarNoticias() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> articles = data['articles'];
        noticias = articles.map((item) => Noticia.fromJson(item)).toList();
        setState(() {});
      } else {
        print('Error en la solicitud HTTP: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> _abrirEnlace(String enlace) async {
    if (await canLaunch(enlace)) {
      await launch(enlace);
    } else {
      print('No se pudo abrir el enlace: $enlace');
    }
  }
}

class Noticia {
  final String titulo;
  final String resumen;
  final String enlace;

  Noticia({
    required this.titulo,
    required this.resumen,
    required this.enlace,
  });

  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      titulo: json['title'],
      resumen: json['description'],
      enlace: json['url'],
    );
  }
}
