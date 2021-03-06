import 'package:flutter/material.dart';
import 'package:keema_app/Authenticate/login.dart';
import 'package:keema_app/animation/fadeAnimation.dart';
import 'package:keema_app/Services/Auth.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
      image: AssetImage('images/background.jpg'),
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
          image: AssetImage('images/light-1.png')) ),),
        )),
        Positioned(
          left: 140,
          width: 80,
          height: 120,
          child: FadeAnimation(3 , Container(
          decoration:
          BoxDecoration(
          image:DecorationImage(
          image: AssetImage('images/light-2.png')) ),),
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
          image: AssetImage('images/clock.png')) ),),
        )),
        Positioned(child:FadeAnimation(4, Container(
        margin: EdgeInsets.only(top:20),
        child: Center(
          child: Text(" Keema " , style: TextStyle(
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
            FadeAnimation(4.2, InkWell(
              onTap: (){
              },
             child: Container(
               
                  child: Text("Forgot Password?", 
                  style: TextStyle(
                  fontSize: 16,
                  color: Color.fromRGBO(143,98,221, .9)
                  ),),
                ),
            ),
            ),
            SizedBox(height:10),
            FadeAnimation(4,
            FlatButton(
              
              onPressed: (){
         
              context.read<AuthService>().SignUp(
                email:emailController.text.trim(),
                password: passwordController.text.trim(),
              );
               if(emailController.text == '' && passwordController.text == ''){
               return showAlertDialog2(context);
              }
              else{
                return showAlertDialog(context);
              }
          
             },

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
                child: Text("Create An Account", 
                style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
                ),)
                ,),
                
                ),
            ),
            ),
              SizedBox(height:10),
                FlatButton(
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Loginpage();
                }));
                
                },
                child: FadeAnimation(4,Container(
                height: 55,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                color: Colors.blue[600],
                width: 2.0

                )
                ),
                  child: Center(child: Text("Sign in",
                  style: TextStyle(color: Colors.blue[600],
                  fontWeight: FontWeight.bold
                  ),
                  ),)
                
                ),
            ),
                )
           ]))])
           
           ));

        
           
            
           
  }
}
showAlertDialog(BuildContext context) {
  // set up the button
  Widget LoginButton = FlatButton(
    child: Text("Login"),
    onPressed: () { 
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
    Loginpage()
    ));
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    
    title: Text("Successful"),
    content: new Container(
    
    width: 80.0,
    height: 40.0,
    decoration: new BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.white,
      borderRadius: BorderRadius.circular(32),
    ),
    child: Text("User Has Been Created!" , 
    style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w700),
    ),
    ),
    actions: [
      LoginButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
showAlertDialog2(BuildContext context) {
  
  // set up the button
  Widget RetryButton = FlatButton(
    child: Text("Retry "),
    onPressed: () { 
    Navigator.push(context, MaterialPageRoute(builder: (context) =>
    SignupPage()
    ));
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Center(child: Text("Please Input Password Or Email !" , style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.red),)),
    content: new Container(
    
    width: 80.0,
    height: 40.0,
    decoration: new BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.white,
      borderRadius: BorderRadius.circular(32),
    ),
    child: Center(
      child: Text("Failed To Created User!" , 
      style: TextStyle(fontSize: 18 , fontWeight: FontWeight.w700),
      ),
    ),
    ),
    actions: [
      RetryButton,
    ],
  );
  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

