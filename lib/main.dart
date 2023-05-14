
import 'package:flutter/material.dart';
import 'package:quickpass/login.dart';
import 'package:quickpass/register.dart';
//import 'package:login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      
      'login' :(context)=>Mylogin(),
      'register' :(context) =>MyRegister()
    },
  ));
}

