import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_ticket_app/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PayTicket',
      initialRoute: '/',
      routes: getRoutes(),
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.amber),
      ),
    );
  }
}
