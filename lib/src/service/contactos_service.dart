import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class ContactosService {
  List<dynamic> listContactos = [];

  Future<List<dynamic>> leerContactos() async {
    final contactos = await rootBundle.loadString('data/contactos.json');

    Map respuesta = json.decode(contactos);

    print(respuesta);

    return listContactos;
  }
}
