// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Contactos extends StatefulWidget {
  const Contactos({Key? key}) : super(key: key);

  @override
  State<Contactos> createState() => _ContactosState();
}

class _ContactosState extends State<Contactos> {
  List<Map<String, dynamic>> _listaContactos = [];
  bool _escarga = true;

  @override
  void initState() {
    _inicializarLista();
    super.initState();
  }

  Future<void> _inicializarLista() async {
    Future.delayed(Duration(seconds: 2), () {
      _listaContactos = [
        {
          "nombres": "Steven Escobar",
          "telefono": "3116451525",
          "iniciales": "SE"
        },
        {
          "nombres": "Daniel De La Pava",
          "telefono": "3217826678",
          "iniciales": "DD"
        },
        {
          "nombres": "Ricardo Valecia",
          "telefono": "74847979976",
          "iniciales": "RV"
        },
        {"nombres": "Juan Diego", "telefono": "44535225", "iniciales": "JD"}
      ];
      _escarga = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contactos"),
        backgroundColor: Colors.green[300],
      ),
      body: Stack(
        children: [
          _opciones(),
          Visibility(
              visible: _escarga,
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              )))
        ],
      ),
    );
  }

  Widget _opciones() {
    return ListView.builder(
      itemCount: _listaContactos.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("${_listaContactos[index]["nombres"]}"),
          subtitle: Text("${_listaContactos[index]["telefono"]}"),
          leading: CircleAvatar(
            backgroundColor: Colors.green[300],
            foregroundColor: Colors.white,
            child: Text("${_listaContactos[index]["iniciales"]}"),
          ),
          trailing: Icon(
            Icons.arrow_circle_right_rounded,
            color: Colors.green[300],
          ),
          onTap: () {
            Navigator.pushNamed(context, 'contacto',
                arguments: {'lista': _listaContactos[index]});
          },
        );
      },
    );
  }
}
