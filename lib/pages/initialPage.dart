import 'package:flutter/material.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(            
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: Container(
            child: Stack(            
              children:[               
                Container(
                  height: size.height,                
                  child: Image(
                    image: AssetImage('assets/parking.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),             
                Container(
                  height: size.height,
                  width: size.width,
                  color: Color.fromRGBO(26, 34, 52, .7),                
                ),             
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width,                
                      child:Image(
                        image: AssetImage('assets/ParkApp-White.png'),
                        height: size.width*.35,                  
                      ),
                    ),
                    _title(size, context),
                    _botones(size, context),                    
                  ],
                ),              
              ]
            ),
          ),
        )
      ),
    );
  }

  // _logo(Size size) {
  //   return Container(
  //     margin: EdgeInsets.only(top: 55),
  //     width: size.width * .5,
  //     decoration: BoxDecoration(
  //         color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
  //     child: Image(
  //       image: AssetImage('assets/ParkApp.png'),
  //     ),
  //   );
  // }
  
  _botones(Size size, BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      _boton(size, context),  
      SizedBox(height:size.width*.05),        
      _boton2(size, context),
    ]);
  }

  _boton(Size size, BuildContext context){
    return Container(      
      width: size.width*.65,
      height: size.width*.10,
      child: RaisedButton(  
        elevation: 20,      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),          
        ),        
        color: Color.fromRGBO(50, 90, 159, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical:10),
              child: Image(
                image: AssetImage('assets/facebook.png'),
                color: Colors.white,                
              ),
            ),
            Text("Iniciar Sesión con Facebook", style: TextStyle(color: Colors.white),),
          ],
        ),
        onPressed: (){
          Navigator.pushNamed(context, 'stackHome');
        },
      ),
    );
  } 

  _boton2(Size size, BuildContext context){
    return Container(      
      width: size.width*.65,
      height: size.width*.10,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.white)
        ),
        color: Colors.white10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical:10),
              child: Image(
                image: AssetImage('assets/googleLogin.png'),                              
              ),
            ),
            Text("Iniciar Sesión con Google", style: TextStyle(color: Colors.white),),
          ],
        ),
        onPressed: (){
        },
      ),
    );
  }  

  // _texto(Size size) {
  //   return Container(
  //     margin: EdgeInsets.only(right: 20, bottom: 10),
  //     width: size.width,
  //     alignment: Alignment.centerRight,
  //     child: Text(
  //       "ParkApp Inc Software",
  //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //     ),
  //   );
  // }

  _title(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:20),      
      width: size.width,      
      child: Text("La Forma Más Rapida De Pagar Tu Boleto", style: TextStyle(fontSize: 27,color: Colors.white, fontFamily: 'coolvetica'),textAlign: TextAlign.center,),
    );
  }

  // _background(Size size) {
  //   return Container(
  //     height: size.height,
  //     width: size.width,
  //     child: Image(
  //       image: AssetImage('assets/new.png'),
  //       fit: BoxFit.fill,
  //     ),
  //   );
  // }
}
