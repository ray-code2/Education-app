import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keema_app/Authenticate/login.dart';
import 'package:keema_app/Home_page.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 final firebaseuser = context.watch<User>();
 if(firebaseuser != null){
  return Homepage();
 }
 return Loginpage();
  }
  
}