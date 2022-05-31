// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:aplicacion_clase/src/service/contactos_service.dart';

class DetallesContacto extends StatefulWidget {
  const DetallesContacto({Key? key}) : super(key: key);

  @override
  State<DetallesContacto> createState() => _DetallesContactoState();
}

class _DetallesContactoState extends State<DetallesContacto> {
  Map<dynamic, dynamic> data = Map<dynamic, dynamic>();

  final contactoService = ContactosService();

  @override
  void initState() {
    contactoService.leerContactos();
    super.initState();
  }

  final _lista2 = [
    {"nombres": "Steven Escobar", "telefono": "3116451525", "iniciales": "SE"},
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
    {"nombres": "Juan Diego", "telefono": "44535225", "iniciales": "JD"},
    {"nombres": "Steven Escobar", "telefono": "3116451525", "iniciales": "SE"},
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
    {"nombres": "Juan Diego", "telefono": "44535225", "iniciales": "JD"},
  ];

  @override
  Widget build(BuildContext context) {
    Map map = ModalRoute.of(context)!.settings.arguments as Map;
    if (map != null) {
      data = map['lista'];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles contacto"),
        backgroundColor: Colors.green[300],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Flexible(
            flex: 1,
            child: _info(),
          ),
          Flexible(
            flex: 6,
            child: Container(child: _lista()),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            flex: 1,
            child: Container(child: _botones()),
          )
        ],
      ),
    );
  }

  Column _info() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green[300],
              foregroundColor: Colors.white,
              child: Text('${data['iniciales']}'),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              '${data['nombres']}',
              style: TextStyle(fontSize: 33),
            )
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.phone, size: 20),
          SizedBox(
            width: 20,
          ),
          Text('${data['telefono']}', style: TextStyle(fontSize: 23))
        ]),
      ],
    );
  }

  Widget _lista() {
    return ListView.builder(
      itemCount: _lista2.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("${_lista2[index]["nombres"]}"),
          subtitle: Text("${_lista2[index]["telefono"]}"),
          leading: CircleAvatar(
            backgroundColor: Colors.green[300],
            foregroundColor: Colors.white,
            child: Text("${_lista2[index]["iniciales"]}"),
          ),
          trailing: Icon(
            Icons.arrow_forward_rounded,
            color: Colors.green[300],
          ),
          onTap: () {},
        );
      },
    );
  }

  Widget _botones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: Colors.green[300],
            onPressed: () {},
            child: Icon(Icons.arrow_back)),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
            heroTag: "btn2",
            backgroundColor: Colors.green[300],
            onPressed: () {},
            child: Icon(Icons.arrow_downward_outlined)),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
            heroTag: "btn3",
            backgroundColor: Colors.green[300],
            onPressed: () {},
            child: Icon(Icons.arrow_forward)),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
