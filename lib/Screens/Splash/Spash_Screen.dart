import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Const/const_fonts.dart';
import 'package:heritage/Const/const_img.dart';
import 'package:heritage/Screens/Home/Home_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    super.initState();
    // Navigate to LoginScreen after 3 seconds
    Future.delayed(Duration(seconds: 2), () {
      // Use Get.off() to navigate to the LoginScreen and remove the SplashScreen from the stack
      Get.off(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,  // Background color from const_Var.dart
      body: Center(
        child: SingleChildScrollView(  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logo, height: 150, width: 150),  // Logo image
              SizedBox(height: 20),  // Adds space between the logo and the text
              Text(
                "Welcome To HeritageSphere",
                style: TextStyle(
                  fontSize: 18,  // Font size
                  fontWeight: FontWeight.bold,      
                  fontFamily: regularfont,  // Font family from const_fonts.dart
                  backgroundColor: Colors.white54,  // Background color for text
                ),
              ),
              SizedBox(height: 40), // Adds space between the two texts
              Text(
                "Welcome To HeritageSphere",  // You can change this to a different message if needed
                style: TextStyle(
                  fontSize: 18,  // Font size
                  fontWeight: FontWeight.bold,  // Font weight
                  fontFamily: boldfont,//ont family
                  backgroundColor: Colors.white54,  // Background color for text
                ),
              ),                          
            ],
          ),
        ),
      ),
    );
  }
}
