import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  Widget build(BuildContext context) {
    Timer(Duration(seconds:7), () {
      Navigator.of(context).pushReplacementNamed('/sp');
    });
  return  Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'EXPLORE THE SPACE WITH US !',
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
          ),
          Container(
            height: 446,
            width: 404,
            decoration: BoxDecoration(
                image: DecorationImage(fit:BoxFit.cover,image: AssetImage('assets/images/galxy.gif',))
            ),

          ),

        ],
      ),
    );
  }
}
