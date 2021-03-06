//Materiales
import 'package:flutter/material.dart';
import 'package:play_ticket_app/pages/creditCardPage.dart';
//Paginas
import 'package:play_ticket_app/pages/initialPage.dart';
import 'package:play_ticket_app/pages/loginPage.dart';
import 'package:play_ticket_app/pages/newInitial_page.dart';
import 'package:play_ticket_app/pages/profile.dart';
import 'package:play_ticket_app/pages/registerPage.dart';
import 'package:play_ticket_app/pages/stackHome.dart';
import 'package:play_ticket_app/pages/termsPage.dart';
import 'package:play_ticket_app/pages/tutorialPage.dart';
import 'package:play_ticket_app/pages/homePage.dart';
import 'package:play_ticket_app/pages/userPage.dart';
import 'package:play_ticket_app/pages/historialPage.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => InitialPage(),
    '//': (BuildContext context) => NewInitialPage(),
    'Login': (BuildContext context) => LoginPage(),
    'Register': (BuildContext context) => RegisterPage(),
    'Tutorial': (BuildContext context) => TutorialPage(),
    'Home': (BuildContext context) => HomePage(),
    'User': (BuildContext context) => UserPage(),
    'Historial': (BuildContext context) => HistorialPage(),
    'creditCard': (BuildContext context) => CreditCardPage(),
    'termsPage': (BuildContext context) => TermsPage(),
    'profile': (BuildContext context) => Profile(),
    'stackHome': (BuildContext context) => StackHome(),
  };
}
