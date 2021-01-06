import 'package:flutter/material.dart';
import 'package:play_ticket_app/widgets/menu_widget.dart';


class HistorialPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(232, 232, 232, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.white,        
      ),
      drawer: MenuWidget(),
      body: Container(
        alignment: Alignment.center,
        child: Column(          
          children: [
            SizedBox(height:15),
            _title(size),
            SizedBox(height:20),
            _listView(size),
          ]
        ),
      ),
   );
  }

  _title(Size size) {
    return Container(
      padding: EdgeInsets.only(left:20),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
      ),
      width: size.width*.9,
      height: 60,
      child: Text("Historial de tickets", style: TextStyle(color: Colors.grey[500], fontSize: 20),),
    );
  }

  _listView(Size size) {
    return Container(
      width: size.width*.9,
      height: size.height*.70,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return Column(
            children: [
              SizedBox(height:20),
              _view(index, size),              
            ],
          );          
        },
        itemCount: 5,
      ),
    );
  }

  _view(int index, Size size) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width*.9,
      height: size.height*.15,
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left:20),            
            height: size.width*.15,
            width: size.width*.15,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Image(
              image: AssetImage('assets/efectivoIcon.png'),
              width: 30,
              color: Colors.white,
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left:15),            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("Centro Comercial Altaria", style: TextStyle(fontSize: 20),),
                Text("36.00", style: TextStyle(fontSize: 18),),
              ]
            ),
          )
        ],
      ),
    );
  }
}