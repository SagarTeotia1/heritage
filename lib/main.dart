import 'package:flutter/material.dart';
import 'package:get/get.dart';  // Import GetX for navigation
import 'package:heritage/Const/const_Var.dart';
import 'package:heritage/Const/const_fonts.dart';
import 'package:heritage/Screens/Splash/Spash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(  // Use GetMaterialApp instead of MaterialApp
      debugShowCheckedModeBanner: false,  // Optional: Hides the debug banner
      home: const SplashScreen(),  // Set your initial screen
      title: appname,  // Use your app's name from const_Var.dart
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,  // Your background color
        fontFamily: regularfont,  // Your custom font from const_fonts.dart
      ),
    );
  }
}
