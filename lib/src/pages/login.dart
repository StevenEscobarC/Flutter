// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:aplicacion_clase/src/service/service_general.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _mostrarPassword = true;

  final formKey = GlobalKey<FormState>();

  String _usuario = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _fondo(),
          _logo(),
          _cuerpo(),
        ],
      ),
    );
  }

  _logo() {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * 0.05),
      child: Column(
        children: [
          Center(
              child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://phantom-marca.unidadeditorial.es/6cdf4a9a2d566858d171648df4d669fb/resize/1320/f/jpg/assets/multimedia/imagenes/2022/05/09/16520913696433.jpg'),
            radius: 60,
            backgroundColor: Colors.white,
          )),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Softlond',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _fondo() {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.green[300],
      width: size.width,
      height: size.height * 0.43,
    );
  }

  Widget _cuerpo() {
    final size = MediaQuery.of(context).size;

    return Center(
        child: Container(
            width: size.width * 0.85,
            height: size.height * 0.42,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              elevation: 10,
              child: SingleChildScrollView(
                child: _formLogin(),
              ),
            )));
  }

  Widget _formLogin() {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          elevation: 1,
          color: Colors.green[300],
          child: Center(
            child: Text(
              'Inicio Sesión',
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(25.0, 0, 25.0, 25.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                _inputUsuario(),
                SizedBox(
                  height: 20.0,
                ),
                _inputPassword(),
                SizedBox(
                  height: 20.0,
                ),
                _boton()
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _inputUsuario() {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.all(8),
        hintText: 'ejemplo@gmail.com',
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.green),
        suffixIcon: Icon(
          Icons.alternate_email,
          color: Colors.green,
        ),
      ),
      validator: (valor) {
        if (valor == '') {
          return 'El campo es obligatorio';
        } else {
          return null;
        }
      },
      onChanged: (valor) {
        _usuario = valor;
      },
    );
  }

  Widget _inputPassword() {
    return TextFormField(
      obscureText: _mostrarPassword,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.all(8),
        hintText: 'Password',
        labelText: 'Password',
        labelStyle: TextStyle(color: Colors.green),
        suffixIcon: IconButton(
          onPressed: () {
            _mostrarPassword = !_mostrarPassword;
            setState(() {});
          },
          icon: Icon(
            _mostrarPassword == true ? Icons.lock : Icons.lock_open,
            color: Colors.green,
          ),
        ),
      ),
      validator: (valor) {
        if (valor == '') {
          return 'El campo es obligatorio';
        } else {
          return null;
        }
      },
      onChanged: (valor) {
        _password = valor;
      },
    );
  }

  Widget _boton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.green[300], // background
        onPrimary: Colors.white, // foreground
      ),
      onPressed: () async {
        //valida la informacion del formulario de los validators
        if (!formKey.currentState!.validate()) return;
        final servicio = Service();
        Map respuesta = await servicio.login(_usuario, _password);

        if (respuesta['ok']) {
          //envio push
          //pushReplacementNamed no muestra flecha para ir a la pagina pasada
          Navigator.pushReplacementNamed(context, 'home');
        } else {
          _mensajeError(respuesta['respuesta']);
        }
      },
      child: Text(
        'INGRESAR',
      ),
    );
  }

  void _mensajeError(String mensaje) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Alerta!'),
            content: Text('$mensaje'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Aceptar')),
            ],
          );
        });
  }
}
