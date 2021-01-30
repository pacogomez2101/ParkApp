import 'package:flutter/material.dart';

class TutorialPage extends StatefulWidget {
  static var kContainer = <Widget>[
    Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Image(
            image: AssetImage('assets/welcome.png'),
            width: 500,
          ),
          SizedBox(height: 15),
          Container(
              child: Text(
            "Bienvenido Francisco!",
            style: TextStyle(
                fontSize: 25,
                color: Colors.amber[900],
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
          SizedBox(height: 15),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dignissim interdum tellus vitae consequat",
            style: TextStyle(fontSize: 20, color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Image(
            image: AssetImage('assets/scan.png'),
            width: 200,
          ),
          SizedBox(height: 15),
          Container(
              child: Text(
            "Escanea tu codigo",
            style: TextStyle(
                fontSize: 25,
                color: Colors.amber[900],
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
          SizedBox(height: 15),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dignissim interdum tellus vitae consequat",
            style: TextStyle(fontSize: 20, color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Image(
            image: AssetImage('assets/market.png'),
            width: 240,
          ),
          SizedBox(height: 15),
          Container(
              child: Text(
            "Realiza tus tareas",
            style: TextStyle(
                fontSize: 25,
                color: Colors.amber[900],
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
          SizedBox(height: 15),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dignissim interdum tellus vitae consequat",
            style: TextStyle(fontSize: 20, color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Image(
            image: AssetImage('assets/pay.png'),
            width: 300,
          ),
          SizedBox(height: 15),
          Container(
              child: Text(
            "Bienvenido Francisco!",
            style: TextStyle(
                fontSize: 25,
                color: Colors.amber[900],
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
          SizedBox(height: 15),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dignissim interdum tellus vitae consequat",
            style: TextStyle(fontSize: 20, color: Colors.grey),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  ];

  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage>
    with SingleTickerProviderStateMixin {
  String btmMessage = "Siguiente";
  bool next = false;
  int _activeTabIndex;
  TabController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    controller.addListener(_tabController);
    super.initState();
  }

  void _tabController() async {
    setState(() {
      _activeTabIndex = controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: DefaultTabController(
          length: TutorialPage.kContainer.length,
          child: Builder(
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    SafeArea(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: MediaQuery.of(context).size.height * .70,
                        child: IconTheme(
                          data: IconThemeData(
                            size: 128.0,
                          ),
                          child: TabBarView(
                              controller: controller,
                              children: TutorialPage.kContainer),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .08,
                                height: 12,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: _activeTabIndex != 1 &&
                                            _activeTabIndex != 2 &&
                                            _activeTabIndex != 3
                                        ? Colors.amber[900]
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .08,
                                height: 12,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: _activeTabIndex == 1
                                        ? Colors.amber[900]
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .08,
                                height: 12,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: _activeTabIndex == 2
                                        ? Colors.amber[900]
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .08,
                                height: 12,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: _activeTabIndex == 3
                                        ? Colors.amber[900]
                                        : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: GestureDetector(
                              onTap: () {
                                if (_activeTabIndex == 3) {
                                  Navigator.pushReplacementNamed(
                                      context, 'stackHome');
                                } else {
                                  setState(() {
                                    controller.animateTo(controller.index + 1);
                                  });
                                }
                              },
                              child: Container(
                                height: size.width * 0.08,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Colors.amber[900],
                                        Colors.amber[700],
                                      ]),
                                ),
                                child: Center(
                                  child: Text(
                                    _activeTabIndex == 3
                                        ? "Iniciar"
                                        : "Siguiente",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
