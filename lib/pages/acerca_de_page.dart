import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(acerca_de_page());
}

class acerca_de_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acerca De',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaginaConBotones(),
    );
  }
}

class PaginaConBotones extends StatelessWidget {
  final String imagenPath = 'assets/foto.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acerca De'),
      ),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset(
                imagenPath,
                width: 250,
                height: 250,
              ),
              SizedBox(height: 20),
              // Botones redondos y de color teal
              BotonConEnlace(
                label: 'Mi Perfil',
                enlace: 'https://plataformavirtual.itla.edu.do/user/profile.php?id=8354',
              ),
              SizedBox(height: 10),
              BotonConEnlace(
                label: 'GitHub',
                enlace: 'https://github.com/romersamil',
              ),
              SizedBox(height: 10),
              BotonConEnlace(
                label: 'YouTube',
                enlace: 'https://www.youtube.com/channel/UCq3lx6UyA9VqSPrf2tBBqCw',
              ),
              SizedBox(height: 10),
              BotonConEnlace(
                label: 'Instagram',
                enlace: 'https://www.instagram.com/?hl=es-la',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BotonConEnlace extends StatelessWidget {
  final String label;
  final String enlace;

  BotonConEnlace({
    required this.label,
    required this.enlace,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _abrirEnlace(enlace),
      child: Text(label),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        primary: Colors.teal, // Color teal
      ),
    );
  }

  Future<void> _abrirEnlace(String enlace) async {
    if (await canLaunch(enlace)) {
      await launch(enlace);
    } else {
      print('No se pudo abrir el enlace: $enlace');
    }
  }
}
