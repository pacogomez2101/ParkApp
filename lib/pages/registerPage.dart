import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String user;
  String email;
  String pass;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Stack(children: [
        background(size),
        Column(children: [
          _bienvenida(size),
          SizedBox(height: size.width * 0.15),
          _formulario(size),
          SizedBox(height: size.width * 0.1),
          _botones(size),
          SizedBox(height: size.width * 0.2),
          _decoracion(size),
          SizedBox(height: size.width * 0.1),
          _redesSociales(size),
          SizedBox(height: size.width * 0.15),
          _flat(size, context),
        ]),
      ])),
    );
  }

  _bienvenida(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.width * .13),
      padding: EdgeInsets.only(left: size.width * .07),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Hola!",
            style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold)),
        Text(
          " Registrate para continuar",
          style: TextStyle(color: Colors.white),
        )
      ]),
    );
  }

  _formulario(Size size) {
    return Container(
      alignment: Alignment.centerLeft,
      width: size.width * .85,
      child: Column(children: [
        _input(
            context,
            'Usuario',
            Icon(
              Icons.person,
              color: Colors.grey,
            )),
        SizedBox(height: size.width * 0.05),
        _input(
            context,
            'Correo electrónico',
            Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        SizedBox(height: size.width * 0.05),
        _input(
            context,
            'Contraseña',
            Icon(
              Icons.vpn_key,
              color: Colors.grey,
            )),
      ]),
    );
  }

  _botones(Size size) {
    return Container(
      child: Column(children: [
        _boton(
            'REGISTRARSE',
            LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.amber[900],
                  Colors.amber[700],
                ]),
            Colors.white,
            size),
      ]),
    );
  }

  _boton(String mensaje, LinearGradient color, Color colorTexto, Size size) {
    return Container(
      width: size.width * .5,
      height: size.width * .1,
      child: GestureDetector(
        onTap: () {
          mensaje == 'INICIAR SESION'
              ? Navigator.pushNamed(context, 'Login')
              : Navigator.pushNamed(context, 'Register');
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: color, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              mensaje,
              style: TextStyle(color: colorTexto),
            ),
          ),
        ),
      ),
    );
  }

  _decoracion(Size size) {
    return Container(
      width: size.width * .85,
      child: Row(
        children: [
          _linea(size),
          SizedBox(width: 10),
          Text(
            'ó',
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(width: 10),
          _linea(size)
        ],
      ),
    );
  }

  _linea(Size size) {
    return Container(
        color: Colors.grey[600],
        height: size.width * .002,
        width: size.width * .38);
  }

  _redesSociales(Size size) {
    return Container(
      child: Column(
        children: [
          Text(
            "Inicia con redes sociales",
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon(size, 'googleLogin.png'),
              SizedBox(width: 12),
              _socialIcon(size, 'faceLogin.png'),
            ],
          )
        ],
      ),
    );
  }

  _socialIcon(Size size, String direction) {
    return Container(
      width:
          direction == 'googleLogin.png' ? size.width * .10 : size.width * .115,
      child: Image(
        image: AssetImage('assets/$direction'),
      ),
    );
  }

  _flat(Size size, BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/');
        },
        child: Text(
          "¿Ya tienes una cuenta?",
          style: TextStyle(color: Colors.amber[900]),
        ),
      ),
    );
  }

  background(size) {
    return Container(
      height: size.width * 0.73,
      width: size.width * 0.73,
      transform: Matrix4.rotationZ(-0.25),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.amber[900],
                Colors.amber[700],
              ]),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          )),
    );
  }

  _input(BuildContext context, String title, Icon icon) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: size.width * 0.05),
        child: Center(
          child: TextFormField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: title,
              border: InputBorder.none,
              icon: icon,
              isCollapsed: true,
              focusColor: Colors.red,
            ),
          ),
        ),
      ),
      height: size.height * 0.06,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 8),
            )
          ]),
    );
  }
}
