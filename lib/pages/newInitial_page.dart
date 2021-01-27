import 'package:flutter/material.dart';

class NewInitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            _background(size),
            Center(
                child: Column(
              children: [
                Spacer(flex: 1),
                _botones(size, context),
                SizedBox(height: 50),
                _texto(size),
              ],
            )),
          ],
        ),
      ),
    );
  }

  // _logo(Size size) {
  //   return Container(
  //     margin: EdgeInsets.only(top: 75),
  //     width: size.width * .5,
  //     decoration: BoxDecoration(
  //         color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
  //     child: Image(
  //       image: AssetImage('assets/ParkApp.png'),
  //     ),
  //   );
  // }

  // _titulos() {
  //   return Container(
  //     child: Column(
  //       children: [
  //         Text(
  //           "PARK APP",
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 25,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         SizedBox(height: 10),
  //         Text(
  //           "La manera más rapida de \npagar tu boleto",
  //           style: TextStyle(
  //               color: Colors.amber, fontSize: 14, fontWeight: FontWeight.bold),
  //           textAlign: TextAlign.center,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  _botones(Size size, BuildContext context) {
    return Container(
      child: Column(children: [
        _boton(context, 'INICIAR SESION', Colors.blueGrey, Colors.white, size),
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
        image: AssetImage('assets/Background2.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
