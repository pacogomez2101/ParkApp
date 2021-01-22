import 'dart:ui';

import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key key}) : super(key: key);

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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: size.width * 0.05,
            ),
            _titulo(size),
            SizedBox(
              height: size.width * 0.05,
            ),
            terms()
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(26, 34, 52, 1),
    );
  }

  Widget _titulo(size) {
    return Row(
      children: [
        SizedBox(width: size.width * 0.05),
        Text(
          'Terminos y condiciones',
          style: TextStyle(
            fontSize: size.width * 0.06,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  terms() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Minim reprehenderit veniam elit est cupidatat non ut commodo. Esse laboris nulla fugiat ipsum dolor mollit ex. Adipisicing anim pariatur qui esse ullamco id incididunt labore amet ut laborum proident Lorem. Commodo dolor quis voluptate sit. Do aliqua fugiat cupidatat nulla occaecat anim adipisicing in pariatur ipsum aliquip sint amet est. Irure non sunt labore Lorem in. Cillum dolor magna commodo labore sunt reprehenderit. Labore culpa adipisicing laboris eu ea duis reprehenderit anim tempor ullamco aliquip ea. Tempor pariatur adipisicing amet ut aliquip dolore velit in. Ex in laborum in adipisicing qui dolor ullamco anim proident nostrud ex qui.\n\n Reprehenderit tempor ullamco duis quis eiusmod ullamco et mollit commodo minim nulla tempor aute exercitation. Proident consequat do commodo velit cillum sit officia labore nostrud excepteur esse ullamco sit in. Et cillum anim proident voluptate deserunt tempor elit laborum dolor proident. Enim consequat consectetur excepteur aliqua anim Lorem non voluptate ipsum id aute. Occaecat pariatur enim enim do qui cillum adipisicing officia aute ut laboris veniam. Ea dolore laboris Lorem labore occaecat. Consequat ipsum exercitation irure commodo commodo. Esse laboris Lorem sit irure laboris culpa occaecat nisi dolore eiusmod fugiat. Ad quis adipisicing aliquip magna duis esse id aliquip velit. Anim occaecat laborum cupidatat consequat ullamco dolore sunt nostrud adipisicing officia. Labore dolore anim reprehenderit duis dolor sunt.\n\n Fugiat voluptate id deserunt et culpa irure minim esse ad sunt quis ad do aute. Do cillum velit dolor pariatur dolor deserunt ea dolore quis. Amet veniam dolore proident deserunt aliquip incididunt laborum duis sit qui. Elit id non laborum labore culpa proident et deserunt tempor officia ex consectetur. Qui labore in id proident non eu cillum cupidatat do nostrud cillum dolore. Pariatur anim duis occaecat laboris ullamco eu commodo ex occaecat. Nostrud excepteur excepteur eiusmod consectetur cillum proident do. Deserunt quis non Lorem quis. Nisi do excepteur officia labore ullamco sit.',
            textAlign: TextAlign.start,
            style: TextStyle(color: Colors.white),
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
