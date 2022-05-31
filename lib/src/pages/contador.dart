// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Contador extends StatefulWidget {
  Contador({Key? key}) : super(key: key);

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int numero = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contador'),
          backgroundColor: Colors.green[300],
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cantidad de taps',
              style: TextStyle(fontSize: 33),
            ),
            SizedBox(
              height: 20,
            ),
            Text('$numero', style: TextStyle(fontSize: 63))
          ],
        )),
        floatingActionButton: _botones());
  }

  Widget _botones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
        ),
        FloatingActionButton(
          heroTag: 'btn1',
          backgroundColor: Colors.green[300],
          child: Icon(Icons.remove),
          onPressed: () {
            _decrementar();
          },
        ),
        SizedBox(
          width: 10,
        ),
        FloatingActionButton(
          heroTag: 'btn2',
          backgroundColor: Colors.green[300],
          child: Icon(Icons.add),
          onPressed: () {
            _incrementar();
          },
        ),
      ],
    );
  }

  void _incrementar() {
    numero++;
    setState(() {});
  }

  void _decrementar() {
    if (numero > 0) {
      numero--;
    }
    setState(() {});
  }
}
