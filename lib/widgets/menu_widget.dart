import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: Colors.amber,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
                width: size.width * .02,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      height: size.width * .3,
                      width: size.width * .3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/profile.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Francisco Gómez',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "franciscog21g@gmail.com",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, 'Home');
              },
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('Perfil', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, 'profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.history, color: Colors.white),
              title: Text('Historial de tickets',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, 'Historial');
              },
            ),
            ListTile(
              leading: Icon(Icons.card_membership, color: Colors.white),
              title:
                  Text('Mis tarjetas', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, 'creditCard');
              },
            ),
            ListTile(
              leading: Icon(Icons.file_copy, color: Colors.white),
              title: Text('Terminos y condiciones',
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, 'termsPage');
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.white),
              title: Text('Salir', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
