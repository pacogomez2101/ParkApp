import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logo(size),
          _titulos(),
          _botones(size, context),
          _texto(),
        ],
      )),
    );
  }

  _logo(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 75),
      width: size.width * .5,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      child: Image(
        image: AssetImage('assets/parkImage.png'),
      ),
    );
  }

  _titulos() {
    return Container(
      child: Column(
        children: [
          Text(
            "PARK APP",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          SizedBox(height: 10),
          Text(
            "La manera más rapida de \npagar tu boleto",
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _botones(Size size, BuildContext context) {
    return Container(
      child: Column(children: [
        _boton(context, 'INICIAR SESION', Colors.black, Colors.white, size),
        _boton(context, 'REGISTRARSE', Colors.white, Colors.black, size),
      ]),
    );
  }

  _boton(BuildContext context, String mensaje, Color color, Color colorTexto,
      Size size) {
    return Container(
      width: size.width * .5,
      child: RaisedButton(
        onPressed: () {
          mensaje == 'INICIAR SESION'
              ? Navigator.pushNamed(context, 'Login')
              : Navigator.pushNamed(context, 'Register');
        },
        child: Text(
          mensaje,
          style: TextStyle(color: colorTexto),
        ),
        color: color,
        elevation: 5,
      ),
    );
  }

  _texto() {
    return Container(
      child: Text(
        "Alefra Software Company",
        style: TextStyle(color: Colors.grey[400]),
      ),
      margin: EdgeInsets.only(bottom: 20),
    );
  }
}
