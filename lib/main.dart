import 'package:flutter/material.dart';
import 'package:valentine/home-screen.dart';
import 'package:valentine/quote_screen.dart';
import 'package:valentine/splash-screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}