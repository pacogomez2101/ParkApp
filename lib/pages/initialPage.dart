import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 34, 52, 1),
      body: SafeArea(
        child: Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: Image(
              image: AssetImage('assets/back.png'),
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              SizedBox(height: size.width * 0.55),
              // _logo(size),
              // SizedBox(height: size.width * 0.3),
              _titulos(),
              SizedBox(height: size.width * 0.3),
              _botones(size, context),
              Spacer(),
              _texto(size),
            ],
          ),
        ]),
      ),
    );
  }

  _logo(Size size) {
    return Container(
      margin: EdgeInsets.only(top: 55),
      width: size.width * .5,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
      child: Image(
        image: AssetImage('assets/ParkApp.png'),
      ),
    );
  }

  _titulos() {
    return Container(
      child: Column(
        children: [
          Text(
            "PARK APP",
            style: TextStyle(
              color: Colors.teal[100],
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 70),
          Text(
            "La manera más rapida de \npagar tu boleto",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  _botones(Size size, BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      _boton(
          context,
          'INICIAR SESION',
          LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.white, Colors.white]),
          Colors.teal[100],
          size,
          Colors.teal[100]),
      SizedBox(width: 15),
      _boton(
          context,
          'REGISTRARSE',
          LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.transparent, Colors.transparent]),
          Colors.white,
          size,
          Colors.white),
    ]);
  }

  _boton(BuildContext context, String mensaje, LinearGradient color,
      Color colorTexto, Size size, Color borde) {
    return Container(
      width: size.width * .4,
      height: size.width * .13,
      child: GestureDetector(
        onTap: () {
          mensaje == 'INICIAR SESION'
              ? Navigator.pushNamed(context, 'Login')
              : Navigator.pushNamed(context, 'Register');
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: borde),
                top: BorderSide(color: borde),
                left: BorderSide(color: borde),
                right: BorderSide(color: borde),
              ),
              gradient: color,
              borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: Text(
              mensaje,
              style: TextStyle(color: colorTexto, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  _texto(Size size) {
    return Container(
      margin: EdgeInsets.only(right: 20, bottom: 10),
      width: size.width,
      alignment: Alignment.centerRight,
      child: Text(
        "ParkApp Inc Software",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  _background(Size size) {
    return Container(
      height: size.height,
      width: size.width,
      child: Image(
        image: AssetImage('assets/new.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
