import 'package:flutter/material.dart';

import '../widgets/menu_widget.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: MenuWidget(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.amber),
        actions: [_appBar(context, size)],
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.width * 0.05,
          ),
          _titulo(size),
          SizedBox(
            height: size.width * 0.1,
          ),
          Expanded(
            child: listView(size),
          ),
        ],
      ),
      backgroundColor: Colors.white,
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: size.width * 0.02),
                  Text(
                    '**** **** **** ****',
                    style: TextStyle(
                        fontSize: size.width * 0.07, color: Colors.grey[400]),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: size.width * 0.02),
                  Text(
                    'Titular',
                    style: TextStyle(
                        fontSize: size.width * 0.05, color: Colors.grey[400]),
                  ),
                ],
              )
            ],
          ),
          height: size.width * 0.5,
          width: size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[400],
              ),
              top: BorderSide(
                color: Colors.grey[400],
              ),
              left: BorderSide(
                color: Colors.grey[400],
              ),
              right: BorderSide(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.amber),
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
      children: [
        SizedBox(width: size.width * 0.05),
        Text(
          'Tarjetas registradas',
          style: TextStyle(
            fontSize: size.width * 0.06,
            color: Colors.grey[400],
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
              style: TextStyle(color: Colors.grey[400]),
            ),
            SizedBox(width: size.width * .02),
            CircleAvatar(
              maxRadius: 15,
              backgroundColor: Colors.amber,
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
