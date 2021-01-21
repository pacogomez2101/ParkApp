import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.05,
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
              ],
            ),
          ),
          Expanded(child: listTile()),
          boton(context),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.2,
          )
        ],
      ),
    );
  }

  List datos = ['Francisco', 'Gómez García', 'franc@gmail.com'];
  List titles = ['Nombre', 'Apellidos', 'Email'];

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
          title: Text(data),
          subtitle: Text(title),
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
            color: Colors.black, borderRadius: BorderRadius.circular(50)),
        height: size.width * 0.13,
        width: size.width * .8,
        child: Center(
            child: Text(
          'ACTUALIZAR DATOS',
          style: TextStyle(color: Colors.white, fontSize: size.width * 0.04),
        )),
      ),
    );
  }
}
