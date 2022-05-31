// ignore_for_file: prefer_const_declarations

import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  Future<Map> login(String usuario, String password) async {
    final url = "http://18.190.32.5:8080/thurni-api/oauth/token";

    final data = {
      'username': usuario,
      'password': password,
      'grant_type': 'password',
      'client_id': 'spring-security-oauth2-read-write-client'
    };

    final respuesta = await http
        .post(Uri.parse(url), body: data, headers: {'Authorization': 'Basic'});
    Map lst = json.decode(respuesta.body); // obtener el contenido

    if (lst.containsKey('access_token')) {
      return {"ok": true, "respuesta": "Exito"};
    } else {
      return {"ok": false, "respuesta": "Invalido"};
    }
  }
}
