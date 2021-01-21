import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              backgroundColor: Colors.black,
              maxRadius: 140,
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Francisco Gómez",
                    style: TextStyle(color: Colors.white, fontSize: 50),
                    textAlign: TextAlign.center,
                  )),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width * .8,
              child: _customInput(false, Icons.person, "Usuario"),
            ),
            SizedBox(height: 20),
            _boton(
                'GUARDAR CAMBIOS', Colors.black, Colors.white, size, context),
          ],
        )),
      ),
    );
  }

  _customInput(bool isPassword, IconData icon, String placeholder) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 25),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.05),
                offset: Offset(0, 5),
                blurRadius: 5)
          ]),
      child: TextField(
        obscureText: isPassword,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Colors.black,
            ),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: '$placeholder'),
      ),
    );
  }

  _boton(String mensaje, Color color, Color colorTexto, Size size,
      BuildContext context) {
    return Container(
      width: size.width * .5,
      child: RaisedButton(
        onPressed: () {},
        child: Text(
          mensaje,
          style: TextStyle(color: colorTexto),
        ),
        color: color,
        elevation: 5,
      ),
    );
  }
}
