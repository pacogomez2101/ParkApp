import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_ticket_app/routes/routes.dart';

void main() => runApp(MyApp());

const PrimaryColor = const Color.fromRGBO(44, 45, 63, 1.0);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      title: 'ParkApp',
      initialRoute: '/',
      routes: getRoutes(),
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.amber),
      ),
    );
  }
}
