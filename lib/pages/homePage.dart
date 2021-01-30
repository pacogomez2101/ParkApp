import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  double borderRadius = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        setState(() {
          xOffset = 0;
          yOffset = 0;
          scaleFactor = 1;
          borderRadius = 0;
          isDrawerOpen = false;
        });
      },
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Colors.white,
        ),
        duration: Duration(milliseconds: 250),
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(scaleFactor),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.amber[900],
                          ),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              borderRadius = 0;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.amber[900],
                          ),
                          onPressed: () {
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              borderRadius = 20;
                              isDrawerOpen = true;
                            });
                          },
                        ),
                  _appBar(size)
                ],
              )),
              Container(
                child: _data(size),
              )
            ],
          ),
        ),
      ),
    );
  }

  _appBar(Size size) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'User');
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Francisco",
              style: TextStyle(color: Colors.amber[900]),
            ),
            SizedBox(width: size.width * .02),
            CircleAvatar(
              maxRadius: 15,
              backgroundColor: Color.fromRGBO(245, 182, 79, 1.0),
              child: Container(
                  alignment: Alignment.center,
                  child: Text('Fr',
                      style: TextStyle(color: Colors.white, fontSize: 10))),
            ),
          ],
        ),
      ),
    );
  }

  _data(Size size) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: Text(
              "Tickets activos",
              style: TextStyle(
                color: Colors.amber[900],
                fontSize: size.width * 0.06,
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                xOffset = 0;
                yOffset = 0;
                scaleFactor = 1;
                borderRadius = 0;
                isDrawerOpen = false;
              });
            },
            padding: EdgeInsets.all(0.0),
            color: Colors.transparent,
            elevation: 450.0,
            child: Container(
              child: Column(
                children: [
                  mitadticketMamalon(),
                  mitadticketMamalon2(),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  // ignore: unused_element
  _ticket(Size size) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              height: size.width * .17,
              width: size.width * .85,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Francisco Gómez",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Centro Comercial Altaria",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.left,
                    )
                  ])),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            height: size.width * .40,
            width: size.width * .85,
            child: Column(children: [
              SizedBox(height: 15),
              Text(
                "Tiempo transcurrido:",
                style: TextStyle(fontSize: 20),
              ),
              Text("1:16:35", style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text("Total a pagar:", style: TextStyle(fontSize: 20)),
              Text("12.00", style: TextStyle(fontSize: 18)),
            ]),
          ),
          SizedBox(height: 170),
          _boton('PAGAR BOLETO', Colors.amber, Colors.white, size, context),
        ],
      ),
    );
  }

  _boton(String mensaje, Color color, Color colorTexto, Size size,
      BuildContext context) {
    return Container(
      width: size.width * .8,
      height: size.width * .15,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Colors.amber[900],
            Colors.amber[700],
          ])),
      child: Center(
          child: Text(
        mensaje,
        style: TextStyle(color: colorTexto),
      )),
    );
  }

  mitadticketMamalon() {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(350,
                200), //You can Replace this with your desired WIDTH and HEIGHT
            painter: RPSCustomPainter1(),
          ),
          infoTicket1()
        ],
      ),
    );
  }

  infoTicket1() {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Text(
            'Francisco Gómez',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.08,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: size.width * 0.02,
          ),
          Text(
            'Centro Comercial Altaria',
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  infoTicket2() {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: size.width * 0.05,
          ),
          Text(
            'Tiempo transcurrido:',
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.05,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: size.width * 0.02,
          ),
          Text(
            '1:16:35',
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: size.width * 0.02,
          ),
          Divider(
            endIndent: 50,
            indent: 50,
            color: Colors.grey[400],
          ),
          SizedBox(
            height: size.width * 0.02,
          ),
          Text(
            'Total a pagar:',
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: size.width * 0.02,
          ),
          Text(
            '\$12.00',
            style: TextStyle(
              color: Colors.black,
              fontSize: size.width * 0.045,
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(
            height: size.width * 0.1,
          ),
          code(),
          SizedBox(
            height: size.width * 0.2,
          ),
          _boton('PAGAR BOLETO', Color.fromRGBO(245, 182, 79, 1.0),
              Colors.white, size, context),
        ],
      ),
    );
  }

  mitadticketMamalon2() {
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomPaint(
            size: Size(350,
                450), //You can Replace this with your desired WIDTH and HEIGHT
            painter: RPSCustomPainter2(),
          ),
          infoTicket2(),
        ],
      ),
    );
  }

  code() {
    return Container(
      child: Image(
        height: 100,
        width: 300,
        image: AssetImage('assets/code.png'),
      ),
    );
  }
}

class RPSCustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.amber[900]
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(size.width, size.height * 0.90);
    path_0.quadraticBezierTo(
        size.width * 0.94, size.height * 0.90, size.width * 0.94, size.height);
    path_0.cubicTo(size.width * 0.72, size.height, size.width * 0.28,
        size.height, size.width * 0.06, size.height);
    path_0.quadraticBezierTo(
        size.width * 0.06, size.height * 0.90, 0, size.height * 0.90);
    path_0.lineTo(0, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.06, 0);
    path_0.lineTo(size.width * 0.94, 0);
    path_0.quadraticBezierTo(
        size.width * 0.94, size.height * 0.05, size.width, size.height * 0.05);
    path_0.quadraticBezierTo(
        size.width, size.height * 0.29, size.width, size.height);
    path_0.lineTo(0, size.height);
    path_0.quadraticBezierTo(0, size.height * 0.29, 0, size.height * 0.05);
    path_0.quadraticBezierTo(
        size.width * 0.06, size.height * 0.05, size.width * 0.06, 0);
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
