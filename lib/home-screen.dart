// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:valentine/quote_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  final formkey = GlobalKey<FormState>();
  
  set name(String name) {}

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: FadeTransition(
            opacity: fadeAnimation,
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/cover-image.jpg",
                  ),
                 const  SizedBox(height: 10),
                 const  Text(
                    "VALENTINE'S GIFTS",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                
                  Container(
                    alignment: Alignment.center,
                    child: const Text("HeartSpeak: Your Personal Valentine's Quote Companion",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0x8a3e2b2b),
                    ),
                    textAlign: TextAlign.center,
                    )
                  ),

                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Enter Your Name",
                      floatingLabelStyle: const TextStyle(
                        color: Colors.red,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.red,
                        )
                      ),
                    ),
                    validator: (value) {
                      if(value == null  || value.isEmpty) {
                        return "Please Enter Your Name";
                      }
                      return null;
                    },
                    onSaved: (newValue) => name = newValue!,
                  ),
                  const SizedBox(height: 30),
                  // ElevatedButton(onPressed: () {
                  //   var _formKey;
                  //   if(_formKey.currentState!. validate()){
                  //     var _formKey;
                  //     _formKey.currentState!.save();
                  //     var _name;
                  //     Navigator.push(context, MaterialPageRoute(builder: (context) => QuoteScreen(name: _name),));
                  //   }
                  // },
                  // style: ElevatedButton.styleFrom(
                  //   backgroundColor: Color(0xffc63026),
                  //   shape: StadiumBorder(),
                  //   padding: 
                  //   EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                  // ),
                  //  child: Text(
                  //   "Let's Celebrate Valentine! ",
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 18,
                  //   ),
                  //  ))
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=> const  QuoteScreen(),
                        )
                      ); 
                    },
                    child: Container(
                      height: 60,
                      width: double.maxFinite,
                      decoration: const  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.red,
                      
                      ),
                      child: const Center(
                        child: Text("Let's Celebrate Valentine!",style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),),
                      ),
                    ),
                  )
                ],
              ),
            ),),
        ),
      ),
    );
  }
    @override
    void dispose() {
      animationController.dispose();
      super.dispose();
    }
  
}
