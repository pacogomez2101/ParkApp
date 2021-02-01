import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const duration = Duration(seconds: 1);
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  double borderRadius = 0;

  String _scanBarcode;

  bool data = false;
  int scanNegativeResult = -1;

  int secondsPassed = 0;
  bool isActive = false;
  Timer timer;

  DateTime date = DateTime.now().toLocal();

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }

  Future<void> scanQr() async {
    String barCodeScanRes;
    try {
      barCodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#FF5300', 'CANCEL', true, ScanMode.QR);
      if (barCodeScanRes == scanNegativeResult.toString()) {
        data = false;
        isActive = isActive;
      } else {
        data = true;
        isActive = !isActive;
      }
      print(barCodeScanRes);
    } on PlatformException {
      barCodeScanRes = 'Failed to get platform version';
    }

    setState(() {
      _scanBarcode = barCodeScanRes;
    });
  }

  Future<void> scanBar() async {
    String barCodeScanRes;
    try {
      barCodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#FF5300', 'CANCEL', true, ScanMode.BARCODE);
      if (barCodeScanRes == scanNegativeResult.toString()) {
        data = false;
        isActive = isActive;
      } else {
        data = true;
        isActive = !isActive;
      }
      print(barCodeScanRes);
    } on PlatformException {
      barCodeScanRes = 'Failed to get platform version';
    }

    setState(() {
      _scanBarcode = barCodeScanRes;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (timer == null) {
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });
    }
    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

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
          child: data == false
              ? Column(
                  children: [
                    SizedBox(
                      height: size.width * 0.03,
                    ),
                    Container(
                        child: Row(
                      children: [
                        isDrawerOpen
                            ? Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 0.5,
                                              blurRadius: 3,
                                              offset: Offset(0, 5),
                                            )
                                          ]),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        xOffset = 0;
                                        yOffset = 0;
                                        scaleFactor = 1;
                                        borderRadius = 0;
                                        isDrawerOpen = false;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: size.width * 0.3,
                                  ),
                                  Container(
                                    width: size.width * 0.1,
                                    height: size.width * 0.1,
                                    child: Image.asset('assets/parkGrey.png'),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              spreadRadius: 0.5,
                                              blurRadius: 3,
                                              offset: Offset(0, 5),
                                            )
                                          ]),
                                      child: Icon(
                                        Icons.menu,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        xOffset = 230;
                                        yOffset = 150;
                                        scaleFactor = 0.6;
                                        borderRadius = 20;
                                        isDrawerOpen = true;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: size.width * 0.3,
                                  ),
                                  Container(
                                    width: size.width * 0.1,
                                    height: size.width * 0.1,
                                    child: Image.asset('assets/parkGrey.png'),
                                  ),
                                ],
                              ),
                      ],
                    )),
                    SizedBox(
                      height: size.width * 0.2,
                    ),
                    Container(
                      child: _data(size),
                    ),
                    SizedBox(
                      height: size.width * 0.2,
                    ),
                    title(size),
                    Spacer(),
                    button(size, 'Escanea QR', () {
                      scanQr();
                      setState(() {});
                    }),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    button(size, 'Escanea Código de Barras', () {
                      scanBar();
                      setState(() {});
                    }),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    adds(size),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      height: size.width * 0.03,
                    ),
                    Container(
                      color: Colors.amber[700],
                      child: Row(
                        children: [
                          isDrawerOpen
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 0.5,
                                                blurRadius: 3,
                                                offset: Offset(0, 5),
                                              )
                                            ]),
                                        child: Icon(
                                          Icons.arrow_back,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          xOffset = 0;
                                          yOffset = 0;
                                          scaleFactor = 1;
                                          borderRadius = 0;
                                          isDrawerOpen = false;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: size.width * 0.3,
                                    ),
                                    Container(
                                      width: size.width * 0.1,
                                      height: size.width * 0.1,
                                      child: Image.asset('assets/parkGrey.png'),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.05,
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 0.5,
                                                blurRadius: 3,
                                                offset: Offset(0, 5),
                                              )
                                            ]),
                                        child: Icon(
                                          Icons.menu,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {
                                          xOffset = 230;
                                          yOffset = 150;
                                          scaleFactor = 0.6;
                                          borderRadius = 20;
                                          isDrawerOpen = true;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: size.width * 0.3,
                                    ),
                                    Container(
                                      width: size.width * 0.1,
                                      height: size.width * 0.1,
                                      child: Image.asset('assets/parkGrey.png'),
                                    ),
                                  ],
                                ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.08,
                    ),
                    title2(size),
                    SizedBox(
                      height: size.width * 0.2,
                    ),
                    ticketUi(size, hours, minutes, seconds),
                    SizedBox(
                      height: size.width * 0.2,
                    ),
                    button(size, 'Pagar Boleto', () {
                      showBottom(size);
                    })
                  ],
                ),
        ),
      ),
    );
  }

  adds(Size size) {
    return Container(
      width: double.infinity,
      height: size.width * 0.2,
      child: Image.asset(
        'assets/chilis.jpg',
        fit: BoxFit.scaleDown,
      ),
    );
  }

  showBottom(Size size) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Stack(children: [
          Container(
            width: double.infinity,
            height: size.width * 0.3,
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
          Container(
            height: size.width * 0.4,
            child: Column(
              children: [
                SizedBox(
                  height: size.width * 0.05,
                ),
                chooseCard(size),
              ],
            ),
          ),
        ]);
      },
    );
  }

  chooseCard(Size size) {
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.05),
      child: GestureDetector(
        onTap: () {
          print('Responsivo');
        },
        child: Container(
          height: size.width * 0.2,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.5,
                  blurRadius: 3,
                  offset: Offset(0, 5),
                ),
              ]),
          child: Column(
            children: [
              SizedBox(
                height: size.width * 0.03,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Image.asset(
                    'assets/master1.png',
                    height: size.width * 0.05,
                  ),
                ],
              ),
              SizedBox(
                height: size.width * 0.01,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Text(
                    'Tarjeta',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: size.width * 0.05,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.15,
                  ),
                  Text(
                    '**** **** **** 4234',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: size.width * 0.05,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ticketUi(Size size, int hours, int minutes, int seconds) {
    return Column(
      children: [
        Container(
          height: size.width * 0.85,
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/time.png',
                    height: size.width * 0.3,
                  ),
                  Text(
                    'Alejandro Roa',
                    style: TextStyle(
                      fontSize: size.width * 0.05,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tiempo transcurrido:',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.width * 0.05),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Text('Tiempo'),
                  SizedBox(width: size.width * 0.02),
                  Text(hours.toString().padLeft(2, '0')),
                  SizedBox(width: size.width * 0.01),
                  Text('-'),
                  SizedBox(width: size.width * 0.01),
                  Text(minutes.toString().padLeft(2, '0')),
                  SizedBox(width: size.width * 0.01),
                  Text('-'),
                  SizedBox(width: size.width * 0.01),
                  Text(seconds.toString().padLeft(2, '0')),
                ],
              ),
              SizedBox(
                height: size.width * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.05,
                  ),
                  Text('Fecha ${date.day} - ${date.month} - ${date.year}')
                ],
              ),
              SizedBox(
                height: size.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/barcode2.png',
                          height: size.width * 0.2,
                        ),
                      ),
                      Text(_scanBarcode),
                    ],
                  )
                ],
              )
            ],
          ),
          width: size.width * .9,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(3, 8),
                )
              ]),
        )
      ],
    );
  }

  Row title(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Escanea el código QR o código de \n           barras de tu boleto',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: size.width * 0.045,
          ),
        ),
      ],
    );
  }

  Row title2(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ticket Activo',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: size.width * 0.06,
          ),
        ),
      ],
    );
  }

  _data(Size size) {
    return Container(
      child: Column(
        children: [
          scan(size),
        ],
      ),
    );
  }

  scan(Size size) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: size.width * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey, width: 2),
                    top: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
              ),
              SizedBox(),
              Container(
                height: size.width * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey, width: 2),
                    top: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/qr3.png',
                  height: size.width * .5,
                  width: size.width * .5,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: size.width * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey, width: 2),
                    bottom: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
              ),
              SizedBox(),
              Container(
                height: size.width * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: Colors.grey, width: 2),
                    bottom: BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  button(Size size, String title, Function function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        height: size.width * 0.13,
        width: size.width * .7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.amber[900],
                  Colors.amber[700],
                ]),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.5,
                blurRadius: 3,
                offset: Offset(0, 5),
              )
            ]),
      ),
    );
  }
}
