import 'package:flutter/material.dart';
import 'package:keema_app/Authenticate/login.dart';
import 'package:keema_app/animation/fadeAnimation.dart';
import 'package:keema_app/Services/Auth.dart';

class ForgotPage extends StatefulWidget {
  @override
  _ForgotPageState createState() => _ForgotPageState();
}

class _ForgotPageState extends State<ForgotPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    resizeToAvoidBottomInset: false, 
    backgroundColor: Colors.white,
    body: Container(
    child: Column(
    children: [
      Container(
      height: 350,
      decoration: BoxDecoration(
      image: DecorationImage(
      image: AssetImage('assets/images/background.jpg'),
      fit: BoxFit.fill
      )),
      child: Stack(
        children: [
        Positioned(
          left: 30,
          width: 80,
          height: 150,
          child: FadeAnimation(2 , 
          Container(
          decoration:
          BoxDecoration(
          image:DecorationImage(
          image: AssetImage('assets/images/light-1.png')) ),),
        )),
        Positioned(
          left: 140,
          width: 80,
          height: 120,
          child: FadeAnimation(3 , Container(
          decoration:
          BoxDecoration(
          image:DecorationImage(
          image: AssetImage('assets/images/light-2.png')) ),),
        )),
         Positioned(
          right: 40,
          width: 80,
          top: 40,
          height: 150,
          child: FadeAnimation(3.5, Container(
          decoration:
          BoxDecoration(
          image:DecorationImage(
          image: AssetImage('assets/images/clock.png')) ),),
        )),
        Positioned(child:FadeAnimation(4, Container(
        margin: EdgeInsets.only(top:20),
        child: Center(
          child: Text(" Reset \n Password " , style: TextStyle(
            letterSpacing: 5,
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ))
        ),
        )),
        )
      ],),
    ),
 Padding(
        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             FadeAnimation(4, TextField(
              obscureText: false,
              controller: emailController,
              decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail_outline , color: Colors.blue[600], size: 20,),
              enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
               ),
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue[600])
      
      ),
              labelText:"Email",
              labelStyle: TextStyle(color: Color.fromRGBO(143,98,221, .9)), ),
               ),
             ),
            SizedBox(height:10),
            FadeAnimation(4, TextField(
                   
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline , color: Colors.blue[600], size: 20,),
               enabledBorder: UnderlineInputBorder(
               borderRadius: BorderRadius.circular(10),
               borderSide: BorderSide.none
               ),
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue[600])
      
      ),
            labelText:"Password",
            labelStyle: TextStyle(color: Color.fromRGBO(143,98,221, .9)), ),
             ),
            ),
           SizedBox(height:10),
            FadeAnimation(4, TextField(
                   
            controller: newPasswordController,
            obscureText: true,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline , color: Colors.blue[600], size: 20,),
               enabledBorder: UnderlineInputBorder(
               borderRadius: BorderRadius.circular(10),
               borderSide: BorderSide.none
               ),
              focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue[600])
      
      ),
            labelText:"New Password",
            labelStyle: TextStyle(color: Color.fromRGBO(143,98,221, .9)), ),
             ),
            ),
            SizedBox(height:30),
            FadeAnimation(4,
            FlatButton(
              
              onPressed: () async{
              Navigator.push(context, MaterialPageRoute(builder: (context){
              return Loginpage();
              }));
              }
            //    if(emailController.text == '' && passwordController.text == ''){
            //    return showAlertDialog2(context);
            //   }
            //   else{
            //     return showAlertDialog(context);
            //   }
          
            //  },
      ,
            child: Container(
            height: 55,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                Color.fromRGBO(143,148,251, 1),
                Color.fromRGBO(143,98,221, .9),
                ]
                )
                ),
                child: Center(
                child: Text("Confirm Changes", 
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
                ),)
                ,),
                
                ),
            ),
            ),
              
           ]))])
           
           ));

        
           
            
           
  }
}
