import 'package:flutter/material.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(26, 34, 52, 1),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [_appBar(context, size)],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.width * 0.05,
          ),
          _titulo(size),
          SizedBox(
            height: size.width * 0.05,
          ),
          Expanded(
            child: listView(size),
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(26, 34, 52, 1),
    );
  }

  Widget listView(size) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(height: size.width * 0.04),
            _card(size),
          ],
        );
      },
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
              borderRadius: BorderRadius.circular(13),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.amber[600],
                    Color.fromRGBO(245, 182, 79, 1.0)
                  ])),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Container(
                decoration: BoxDecoration(
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
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: Colors.red),
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

  Widget _titulo(size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: size.width * 0.05),
        Text(
          'Tarjetas registradas',
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  _appBar(context, size) {
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
              style: TextStyle(color: Colors.white),
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
}
