import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Services/Auth.dart';
class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("HOME"),
          RaisedButton(
            child: Text("Sign Out"),
            onPressed: (){
            context.read<AuthService>().Signout();
          })
        ],
      )
    )
    );
  }
}