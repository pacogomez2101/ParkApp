import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Color.fromRGBO(26, 34, 52, 1),
      child: Column(
        children: [
          SizedBox(
            height: size.width * 0.6,
          ),
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
