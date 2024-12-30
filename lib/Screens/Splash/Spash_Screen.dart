import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Const/const_fonts.dart';
import 'package:heritage/Const/const_img.dart';
import 'package:heritage/Screens/Home/Home_Screen.dart';
import 'package:heritage/Widgets/Spash/appiconWidget.dart';

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
    Future.delayed(Duration(seconds: 3), () {
      // Use Get.off() to navigate to the LoginScreen and remove the SplashScreen from the stack
      Get.off(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg, // Background color from const_colo.dart
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              AppIconWidget(),
              

              SizedBox(height: 15), // Adds space between the logo and the text
              Text(
                "HeritageSphere",
                style: TextStyle(
                  fontSize: 18, // Font size
                  fontWeight: FontWeight.bold,
                  fontFamily: regularfont, // Font family from const_fonts.dart
                  // Background color for text
                ),
              ),
              SizedBox(height: 25), // Adds space between the two texts
              Text(
                "Explore, Preserve, Empower", // A meaningful welcome message
                style: TextStyle(
                  fontSize: 11, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                  fontFamily: boldfont, // Font family from const_fonts.dart
              //     backgroundColor: Colors.white54, // Background color for text
                ),
              ),
                            SizedBox(height: 5), // Adds space between the two texts
              Text(
                "– Virtually Anywhere", // A meaningful welcome message
                style: TextStyle(
                  fontSize: 11, // Font size
                  fontWeight: FontWeight.bold, // Font weight
                  fontFamily: boldfont, // Font family from const_fonts.dart
              //     backgroundColor: Colors.white54, // Background color for text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
