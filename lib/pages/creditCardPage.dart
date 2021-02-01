import 'package:flutter/material.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Row(
          children: [
            SizedBox(
              width: size.width * 0.03,
            ),
            GestureDetector(
              child: Container(
                height: size.width * 0.1,
                width: size.width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          title(size, 'Tus tarjetas'),
          SizedBox(
            height: size.width * 0.05,
          ),
          _card(size),
          title(size, 'Historial de pagos'),
          SizedBox(
            height: size.width * 0.05,
          ),
          Expanded(
            child: ticketHistory(size),
          )
        ],
      ),
    );
  }

  Widget title(Size size, String title) {
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.05,
        ),
        Text(
          title,
          style:
              TextStyle(color: Colors.grey[500], fontSize: size.width * 0.06),
        ),
      ],
    );
  }

  // Widget listView(size) {
  //   return ListView.builder(
  //     physics: BouncingScrollPhysics(),
  //     itemCount: 1,
  //     shrinkWrap: true,
  //     itemBuilder: (BuildContext context, int index) {
  //       return Column(
  //         children: [
  //           SizedBox(height: size.width * 0.04),
  //           _card(size),
  //         ],
  //       );
  //     },
  //   );
  // }

  Widget ticketHistory(size) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return ticket(size);
      },
    );
  }

  Widget ticket(size) {
    return Column(
      children: [
        Container(
          height: size.width * 0.25,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 8),
              )
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.02,
              ),
              Container(
                height: size.width * 0.2,
                width: size.width * 0.2,
                child: Image.asset('assets/payment.png'),
              )
            ],
          ),
        ),
        SizedBox(
          height: size.width * 0.05,
        )
      ],
    );
  }

  Widget _card(size) {
    return Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.width * 0.05),
              Row(
                children: [
                  SizedBox(width: size.width * 0.05),
                  Image(
                    image: AssetImage('assets/master1.png'),
                    height: size.width * 0.1,
                  )
                ],
              ),
              SizedBox(height: size.width * 0.05),
              Row(
                children: [
                  SizedBox(width: size.width * 0.05),
                  Text(
                    '2145   0875   5325   2355',
                    style: TextStyle(
                        fontSize: size.width * 0.06, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: size.width * 0.05),
              Row(
                children: [
                  SizedBox(width: size.width * 0.05),
                  Text(
                    'VALID \nTHRU',
                    style: TextStyle(
                        fontSize: size.width * 0.03, color: Colors.white),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    '05/27',
                    style: TextStyle(
                        fontSize: size.width * 0.04, color: Colors.white),
                  )
                ],
              )
            ],
          ),
          height: size.width * 0.6,
          width: size.width * 0.9,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 8),
                )
              ],
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.amber[900],
                    Colors.amber[700],
                  ])),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 8),
                      )
                    ],
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(245, 182, 79, 1.0)),
                child: Icon(
                  Icons.autorenew,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 8),
                  )
                ], borderRadius: BorderRadius.circular(50), color: Colors.red),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
