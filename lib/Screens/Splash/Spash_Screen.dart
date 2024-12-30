import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/Const/const_fonts.dart';
import 'package:heritage/Screens/AUTH/authprescreen.dart';
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
    // Navigate to PreAuthScreen after 3 seconds
    Future.delayed(Duration(seconds: 1), () {
      Get.off(() => PreAuthScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/splashpagebg.png',
            fit: BoxFit.cover,
          ),
          // Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIconWidget(),
                  const SizedBox(height: 15),
                  Text(
                    "HeritageSphere",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: regularfont,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Explore, Preserve, Empower",
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: boldfont,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "– Virtually Anywhere",
                    style: TextStyle(
                      fontSize: 11,
                      fontFamily: boldfont,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
