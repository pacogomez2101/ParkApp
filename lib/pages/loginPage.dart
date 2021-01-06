import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String pass;
  @override
  Widget build(BuildContext context) {    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(          
            child: Column(     
              mainAxisAlignment: MainAxisAlignment.spaceBetween,                  
              children: [
                _bienvenida(size),
                SizedBox(height:size.width*.1),
                _formulario(size),
                SizedBox(height:size.width*.05),
                _botones(size, context),
                SizedBox(height:size.width*.05),
                _decoracion(size),
                SizedBox(height:size.width*.05),
                _redesSociales(size),
                SizedBox(height:size.width*.05),                
                _flat(size, context)          
              ]
            )
          ),
        ),
      )
   );
  }

  _bienvenida(Size size) {
    return Container(
      margin: EdgeInsets.only(top: size.width*.13),
      padding: EdgeInsets.only(left: size.width*.07),
      alignment: Alignment.centerLeft,
      width: double.infinity,      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text("Bienvenido!", style: TextStyle(color: Colors.amber, fontSize: 40, fontWeight: FontWeight.bold)),
          Text("Inicia sesión para continuar", style: TextStyle(color: Colors.grey[400]),)
        ]
      ),
    );
  }

  _formulario(Size size) {    
    return Container(
      alignment: Alignment.centerLeft,
      width: size.width*.85,      
      child: Column(        
        children: [          
          _customInput(false, Icons.email, "Correo electronico"),                    
          _customInput(true, Icons.lock, "Contraseña")          
        ]
      ),
    );
  }

  _botones(Size size, BuildContext context) {
    return Container(
      child: Column(
        children: [
          _boton('INICIAR SESION', Colors.amber, Colors.white,size,context),
          FlatButton(
            onPressed: (){}, 
            child: Text("¿Olvidaste tu contraseña?", style: TextStyle(color: Colors.grey[500]),)),
        ]
      ),
    );
  }  

  _boton(String mensaje, Color color, Color colorTexto, Size size,BuildContext context) {
    return Container(
      width: size.width*.5,
      child: RaisedButton(      
        onPressed:(){
          if(email=="paco"&&pass=="12345"){
            Navigator.pushReplacementNamed(context, 'Tutorial');
          }else{
            print("CONTRASEÑA O USUARIO INCORRECTOS");
          }
        },
        child: Text(mensaje, style: TextStyle(color: colorTexto),),
        color: color,       
        elevation: 5,      
      ),
    );
  }

  _decoracion(Size size) {
    return Container(
      width: size.width*.85,      
      child: Row(
        children: [
          _linea(size),
          SizedBox(width:10),
          Text('ó'),
          SizedBox(width:10),
          _linea(size)
        ],
      ),
    );
  }

  _linea(Size size) {
    return Container(
      color: Colors.black,
      height: size.width*.002,
      width: size.width*.38
    );
  }

  _redesSociales(Size size) {
    return Container(       
      child: Column(        
        children: [
          Text("Inicia con redes sociales"),
          SizedBox(height:15),
          Row(         
            mainAxisAlignment: MainAxisAlignment.center,   
            children: [
              _socialIcon(size, 'googleLogin.png'),
              SizedBox(width:12),
              _socialIcon(size, 'faceLogin.png'),
            ],
          )
        ],
      ),
    );
  }

  _socialIcon(Size size,String direction) {
    return Container(
      width: direction=='googleLogin.png'? 
              size.width*.10:
              size.width*.115,
      child: Image(
        image: AssetImage('assets/$direction'),
      ),
    );
  }

  _flat(Size size, BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed:(){
          Navigator.pushReplacementNamed(context, 'Register');
        },
        child: Text("¿Todavia no tienes una cuenta?"),
      ),
    );
  }

  _customInput(bool isPassword, IconData icon, String placeholder){
    return Container(  
      margin: EdgeInsets.only(bottom:20),
      padding: EdgeInsets.only(top:5, left:5, bottom:5, right:25),          
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color:Colors.black.withOpacity(.05),
            offset: Offset(0, 5),
            blurRadius: 5
          )
        ]
      ),
      child: TextField(        
        obscureText: isPassword,
        autocorrect: false,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon:Icon(icon, color: Colors.amber,), 
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: '$placeholder'
        ),   
        onChanged: (value){
          isPassword==true?
          pass = value
          :email = value;
        },           
      ),
    );
  }
}