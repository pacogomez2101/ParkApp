import 'package:flutter/material.dart';
import 'package:play_ticket_app/pages/drawerPage.dart';
import 'package:play_ticket_app/pages/homePage.dart';

class StackHome extends StatelessWidget {
  const StackHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DrawerPage(),
          HomePage(),
        ],
      ),
    );
  }
}
