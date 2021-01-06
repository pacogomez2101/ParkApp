import 'package:flutter/material.dart';
import 'package:play_ticket_app/widgets/menu_widget.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool data = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(  
      drawer: MenuWidget(),
      appBar: AppBar(        
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.amber),
        actions: [
          _appBar(size)
        ],
      ),
      body: SafeArea(
        child:data==true
        ?_data(size)
        :_noData(),         
      )
   );
  }

  _appBar(Size size) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'User');
      },
      child: Container(      
        margin: EdgeInsets.only(right:15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Francisco", style: TextStyle(color: Colors.grey[400]),),
            SizedBox(width: size.width*.02),
            CircleAvatar(      
              maxRadius: 15,                  
              backgroundColor: Colors.amber,            
              child: Container(              
                alignment: Alignment.center,
                child: Text('Fr', style: TextStyle(color: Colors.white, fontSize: 10))
                ),
            ),
          ],
        ),
      ),
    );
  }

  _data(Size size) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical:20),
        child: Column(          
          children: [            
            Text("Tickets activos", style: TextStyle(color: Colors.grey[400], fontSize: 18),),
            Container(
              child:_ticket(size),
            )
          ]
        ),
      ),
    );
  }

  _noData() {}

  _ticket(Size size) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(      
        children: [
          Container(
            padding: EdgeInsets.only(left:20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),)
            ),
            height: size.width*.17,
            width: size.width*.85,          
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Francisco Gómez", style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.left,),
                Text("Centro Comercial Altaria", style: TextStyle(color: Colors.white, fontSize: 12),textAlign: TextAlign.left,)
              ]
            )
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20),)
            ),
            height: size.width*.40,
            width: size.width*.85,  
            child: Column(
              children: [
                SizedBox(height:15),
                Text("Tiempo transcurrido:",style: TextStyle(fontSize: 20),),
                Text("1:16:35",style: TextStyle(fontSize: 18)),
                SizedBox(height:20),
                Text("Total a pagar:",style: TextStyle(fontSize: 20)),
                Text("12.00",style: TextStyle(fontSize: 18)),
              ]
            ),
          ),
          SizedBox(height:170),                                    
          _boton('PAGAR BOLETO', Colors.amber, Colors.white,size,context),
        ],      
      ),
    );
  }

  _boton(String mensaje, Color color, Color colorTexto, Size size,BuildContext context) {
    return Container(
      width: size.width*.5,
      child: RaisedButton(      
        onPressed:(){        
        },
        child: Text(mensaje, style: TextStyle(color: colorTexto),),
        color: color,       
        elevation: 5,      
      ),
    );
  }
}