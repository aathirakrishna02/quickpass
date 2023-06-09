import 'package:flutter/material.dart';
import 'package:quickpass/firebase_options.dart';
import 'package:quickpass/login.dart';
//import 'package:quickpass/register.dart';
//import 'package:quickpass/splash.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => LoginScreen(),
      //'register' :(context) =>SignupScreen()
    },
  ));
}
