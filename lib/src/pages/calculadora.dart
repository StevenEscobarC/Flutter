import 'dart:math';

import 'package:flutter/material.dart';

class Calculadora extends StatefulWidget {
  Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  double resultado = 0;
  String resultadoPantalla = '0.0';
  String diagnosticoPantalla = '';
  String detallePantalla = '';

  final WeightController = TextEditingController();
  final heightController = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    WeightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.green[300],
      ),
      body: Scaffold(
        body: Stack(
          children: [
            Fondo(),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(children: [
                Flexible(child: CamposTexto()),
                Flexible(
                  child: Mitad(),
                ),
                Flexible(child: Resultado())
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget CamposTexto() {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.35,
      width: size.width * 0.90,
      color: Colors.green,
      child: Card(
        elevation: 20,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  "Calculadora IMC",
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Container(
                height: size.height * 0.10,
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Center(
                        child: Text(
                          "Peso (kg)",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Center(
                        child: Text(
                          "Estatura (m)",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.green,
                height: 1,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Center(
                          child: TextField(
                            controller: WeightController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Center(
                          child: TextField(
                            controller: heightController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Fondo() {
    return Container(
      color: Colors.green[300],
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Container(
          color: Colors.green[300],
        ),
      ),
    );
  }

  Widget Resultado() {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.35,
      width: size.width * 0.90,
      color: Colors.green,
      child: Card(
        child: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                '$resultadoPantalla',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '$diagnosticoPantalla',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )),
        elevation: 20,
      ),
    );
  }

  Widget Mitad() {
    return Container(
      height: 100,
      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Container(
        height: 100,
        color: Colors.green[300],
        child: Center(child: _botones()),
      ),
    );
  }

  Widget _botones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white, // background
            onPrimary: Colors.green[300], // foreground
          ),
          onPressed: () {
            resultadoPantalla = calculoIMC().toStringAsFixed(2);

            diagnostico();

            setState(() {});
          },
          child: Text(
            'CALCULAR',
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white, // background
            onPrimary: Colors.green[300], // foreground
          ),
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                      title: Text(
                        '$diagnosticoPantalla',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green[300],
                        ),
                      ),
                      content: Text(
                        '$detallePantalla',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          child: Text('Aceptar'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white, // background
                            onPrimary: Colors.green[300], // foreground
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ));
          },
          child: Text(
            'DETALLE',
          ),
        ),
        SizedBox(
          width: 10,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white, // background
            onPrimary: Colors.green[300], // foreground
          ),
          onPressed: () {
            resultadoPantalla = '0.0';
            diagnosticoPantalla = '';
            WeightController.clear();
            heightController.clear();
            setState(() {});
          },
          child: Text(
            'LIMPIAR',
          ),
        ),
      ],
    );
  }

  void diagnostico() {
    if (calculoIMC() < 18.5) {
      diagnosticoPantalla = 'Peso bajo';
      detallePantalla = "Riesgo moderado de desnutrición, alimentate más";
    } else if (calculoIMC() >= 18.5 && calculoIMC() <= 24.9) {
      diagnosticoPantalla = 'Peso normal';
      detallePantalla = "Estado saludable, sigues con tu plan de alimentación";
    } else if (calculoIMC() >= 25 && calculoIMC() <= 29.9) {
      diagnosticoPantalla = 'Sobrepeso';
      detallePantalla =
          "Riesgo moderado de sobrepeso, alimentate más saludable";
    } else if (calculoIMC() >= 30) {
      diagnosticoPantalla = 'Obesidad';
      detallePantalla =
          "Obesidad grado 1, sigue un plan alimenticio y has actividad física";
    }
  }

  double calculoIMC() {
    resultado = int.parse(WeightController.text) /
        pow(double.parse(heightController.text), 2);

    return resultado;
  }
}
