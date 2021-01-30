import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          Container(
            child: Center(
              child: Image.asset(
                'assets/ParkApp-White.png',
                height: size.height * 0.1,
              ),
            ),
            height: size.height * .4,
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100.0)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.amber[900],
                      Colors.amber[700],
                    ])),
          ),
          SizedBox(height: size.width * 0.15),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _input(
                        context,
                        'Email',
                        Icon(
                          Icons.mail,
                          color: Colors.grey,
                          size: size.width * 0.05,
                        )),
                  ],
                ),
                SizedBox(
                  height: size.width * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _input(
                        context,
                        'Password',
                        Icon(
                          Icons.vpn_key,
                          color: Colors.grey,
                          size: size.width * 0.05,
                        )),
                  ],
                ),
                SizedBox(
                  height: size.width * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                        onPressed: () {},
                        child: Text(
                          'Olvidaste tu contraseña?',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500),
                        )),
                    SizedBox(width: size.width * 0.1),
                  ],
                ),
                SizedBox(height: size.width * 0.1),
                _loginButton(size, context),
                SizedBox(height: size.width * 0.1),
                _redesSociales(size),
                SizedBox(height: size.width * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Aun no tienes cuenta?'),
                    FlatButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, 'Register'),
                        child: Text(
                          'Registrate',
                          style: TextStyle(color: Colors.amber[900]),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _loginButton(size, context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'Tutorial'),
      child: Container(
        child: Center(
          child: Text(
            'LOGIN',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        height: size.width * 0.12,
        width: size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.amber[900],
                  Colors.amber[700],
                ])),
      ),
    );
  }

  _redesSociales(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialIcon(size, 'googleLogin.png'),
        SizedBox(width: 12),
        _socialIcon(size, 'faceLogin.png'),
      ],
    );
  }

  _socialIcon(Size size, String direction) {
    return Container(
      width:
          direction == 'googleLogin.png' ? size.width * .10 : size.width * .115,
      child: Image(
        image: AssetImage('assets/$direction'),
      ),
    );
  }

  _input(BuildContext context, String title, Icon icon) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: size.width * 0.05),
        child: Center(
          child: TextFormField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: title,
              border: InputBorder.none,
              icon: icon,
              isCollapsed: true,
              focusColor: Colors.red,
            ),
          ),
        ),
      ),
      height: size.height * 0.06,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 8),
            )
          ]),
    );
  }
}
