import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Row(
          children: [
            SizedBox(
              width: size.width * 0.03,
            ),
            GestureDetector(
              child: Container(
                height: size.width * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0.5,
                        blurRadius: 3,
                        offset: Offset(0, 5),
                      )
                    ]),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.grey,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            color: Colors.white,
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
                      color: Colors.grey[600],
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
            style: TextStyle(color: Colors.grey[600]),
          ),
          subtitle: Text(
            title,
            style: TextStyle(color: Colors.grey[600]),
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
                colors: [
                  Colors.amber[900],
                  Colors.amber[700],
                ]),
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
