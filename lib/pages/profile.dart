import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(26, 34, 52, 1),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color.fromRGBO(26, 34, 52, 1),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            color: Color.fromRGBO(26, 34, 52, 1),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.3,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/profile.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                Text(
                  'Francisco Gómez',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.05),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
                ),
                boton(context)
              ],
            ),
          ),
          Expanded(child: listTile()),
        ],
      ),
    );
  }

  List datos = [
    'Francisco',
    'Gómez García',
    'franc@gmail.com',
    '+524*******10'
  ];
  List titles = ['Nombre', 'Apellidos', 'Email', 'Numero de teléfono'];

  Widget listTile() {
    return ListView.builder(
      itemCount: datos.length,
      itemBuilder: (BuildContext context, int index) {
        return tile(datos[index], titles[index]);
      },
    );
  }

  Widget tile(String title, String data) {
    return Column(
      children: [
        ListTile(
          title: Text(
            data,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Divider()
      ],
    );
  }

  Widget boton(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RaisedButton(
      padding: EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      onPressed: () {},
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.amber[600], Color.fromRGBO(245, 182, 79, 1.0)]),
            borderRadius: BorderRadius.circular(50)),
        height: size.width * 0.1,
        width: size.width * .6,
        child: Center(
            child: Text(
          'ACTUALIZAR DATOS',
          style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
        )),
      ),
    );
  }
}
