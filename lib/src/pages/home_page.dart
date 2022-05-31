// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.green[300],
      ),
      body: _opciones(),
    );
  }

  Widget _opciones() {
    return ListView(
      children: [
        ListTile(
          title: Text("Proyecto contador"),
          subtitle: Text("Contador"),
          leading: Icon(
            Icons.format_list_numbered,
            color: Colors.green[300],
          ),
          trailing: Icon(
            Icons.arrow_circle_right_rounded,
            color: Colors.green[300],
          ),
          onTap: () {
            Navigator.pushNamed(context, 'contador');
          },
        ),
        Divider(),
        ListTile(
          title: Text("Contactos"),
          subtitle: Text("Contador"),
          leading: Icon(
            Icons.contacts_rounded,
            color: Colors.green[300],
          ),
          trailing: Icon(
            Icons.arrow_circle_right_rounded,
            color: Colors.green[300],
          ),
          onTap: () {
            Navigator.pushNamed(context, 'contactos');
          },
        ),
        Divider(),
        ListTile(
          title: Text("Proyecto IMC"),
          subtitle: Text("Imc"),
          leading: Icon(
            Icons.calculate_sharp,
            color: Colors.green[300],
          ),
          trailing: Icon(
            Icons.arrow_circle_right_rounded,
            color: Colors.green[300],
          ),
          onTap: () {
            Navigator.pushNamed(context, 'calculadora');
          },
        )
      ],
    );
  }
}
