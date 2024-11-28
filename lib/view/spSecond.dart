import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
class SpSecondScreen extends StatefulWidget {
  const SpSecondScreen({super.key});

  @override
  State<SpSecondScreen> createState() => _SpSecondScreenState();
}

class _SpSecondScreenState extends State<SpSecondScreen> {
  @override



  Widget build(BuildContext context) {
    Timer(Duration(seconds:4), () {
      // Navigator.of(context).pushReplacementNamed('/home');
    });
    return   Scaffold(

     backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [



            Container(
              height: 846,
              width: 404,
              decoration: BoxDecoration(
                  image: DecorationImage(fit:BoxFit.cover,image: AssetImage('assets/images/bg.jpg',))
              ),

child: Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(36.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              " Let's Get knowledge Of Space !",
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
              speed: const Duration(milliseconds: 200),
            ),
          ],

          totalRepeatCount: 4,
          pause: const Duration(milliseconds: 100),
          displayFullTextOnTap: true,
          stopPauseOnTap: true,
        ),
      ),
    ),
    SizedBox(height: 500,),
    GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/home');
      },
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(colors: [Colors.purple,Colors.red.shade200])
        ),
        child: Center(child: Text('Get Start',style: TextStyle(color: Colors.white,fontSize: 32),)),
      ),
    ),
  ],
),
            ),

          ],
        ),
      ),
    );



  }
}
