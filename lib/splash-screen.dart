import 'dart:async';

import 'package:flutter/material.dart';
import 'package:valentine/home-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);  

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5), (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen(),));
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("image/vale.jpeg"),
            fit: BoxFit.cover,
            opacity: 0.6,
          )
        ),
        child: const Center(
          child: Text("Happy Valentines\n Day",
          style: TextStyle(
            color: Colors.red,
            fontSize: 45,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          )
          ),
      ),
    );
  }
}