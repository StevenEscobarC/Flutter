// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aplicacion_clase/src/pages/calculadora.dart';
import 'package:flutter/material.dart';
import 'package:aplicacion_clase/src/pages/contactos.dart';
import 'package:aplicacion_clase/src/pages/contador.dart';
import 'package:aplicacion_clase/src/pages/detalles_contacto.dart';
import 'package:aplicacion_clase/src/pages/home_page.dart';
import 'package:aplicacion_clase/src/pages/login.dart';

void main() => runApp(aplicacion_clase());

class aplicacion_clase extends StatefulWidget {
  @override
  State<aplicacion_clase> createState() => _aplicacion_claseState();
}

class _aplicacion_claseState extends State<aplicacion_clase> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
      routes: {
        "contador": (BuildContext context) => Contador(),
        "contactos": (BuildContext context) => Contactos(),
        "home": (BuildContext context) => HomePage(),
        "calculadora": (BuildContext context) => Calculadora(),
        "contacto": (BuildContext context) => DetallesContacto()
      },
    );
  }
}
