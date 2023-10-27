import 'package:flutter/material.dart';
import 'package:tarea6_romeramparo/main.dart';
import 'nombre_genero_page.dart';
import 'nombre_edad_page.dart';
import 'pais_uni_page.dart';
import 'clima_page.dart';
import 'noticias_page.dart';
import 'acerca_de_page.dart';
import 'inicio.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});


  @override
  Widget build(BuildContext context){
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: const Text('Romer Amparo'), 
              accountEmail: const Text('romeramparo@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(child: Image.asset('assets/foto.jpg'),),
              ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: const Text('H O M E'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyApp()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: const Text('N O M B R E + G E N D E R'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nombre_genero_page()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.perm_contact_cal_rounded),
            title: const Text('N O M B R E  + E D A D'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => nombre_edad_page()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.flag_circle_rounded),
            title: const Text('P A I S + U N I V E R S I D A D'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pais_uni_page()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.cloud),
            title: const Text('C L I M A'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => clima_page()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.party_mode_outlined),
            title: const Text('N O T I C I A S'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => noticias_page()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: const Text('A C E R C A  D E'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => acerca_de_page()),
              );
            },
          ),

        ],
      ),

    );
  }

}
