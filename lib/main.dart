import 'package:animated_pr_ui/controller/controller.dart';
import 'package:animated_pr_ui/view/home.dart';
import 'package:animated_pr_ui/view/spSecond.dart';
import 'package:animated_pr_ui/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeController(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>SplashScreen(),
        '/sp':(context)=>SpSecondScreen(),
        '/home':(context)=>HomeScreen(),

      },
    );
  }
}

