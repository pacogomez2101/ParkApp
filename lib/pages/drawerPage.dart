import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.amber[700],
            Colors.amber[900],
          ])),
      child: Column(
        children: [
          SizedBox(
            height: size.width * 0.3,
          ),
          Container(
            margin: EdgeInsets.only(right: size.width * 0.4),
            width: double.infinity,
            child: Image.asset(
              'assets/ParkApp-White.png',
              height: size.width * 0.3,
            ),
          ),
          SizedBox(height: size.width * 0.1),
          listTile(
            context,
            'profile',
            Icon(
              Icons.person,
              color: Colors.white,
            ),
            'Perfil',
          ),
          listTile(
            context,
            'Historial',
            Icon(
              Icons.history,
              color: Colors.white,
            ),
            'Historial de tickets',
          ),
          listTile(
            context,
            'creditCard',
            Icon(
              Icons.card_membership,
              color: Colors.white,
            ),
            'Mis tarjetas',
          ),
          listTile(
            context,
            'termsPage',
            Icon(
              Icons.file_copy,
              color: Colors.white,
            ),
            'Términos y \ncondiciones',
          ),
          listTile(
            context,
            '/',
            Icon(
              Icons.logout,
              color: Colors.white,
            ),
            'Salir',
          ),
        ],
      ),
    );
  }

  listTile(BuildContext context, String ruta, Icon icon, String title) {
    return ListTile(
      leading: icon,
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pushNamed(context, ruta);
      },
    );
  }
}
