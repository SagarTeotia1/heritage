import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Const/const_fonts.dart';
import 'package:heritage/Screens/AUTH/Choose_avtarScreen.dart';
import 'package:heritage/Widgets/Spash/appiconWidget.dart';

class PreAuthScreen extends StatefulWidget {
  const PreAuthScreen({super.key});

  @override
  State<PreAuthScreen> createState() => _PreAuthScreenState();
}

class _PreAuthScreenState extends State<PreAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wrap the Scaffold's body with a Container to set the background image
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/GETSTARTEDBG.png'), // Path to the image in assets
            fit: BoxFit.cover, // Cover the entire screen with the image
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              AppIconWidget(),
              const SizedBox(height: 10),
              Text(
                "Heritage Sphere",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: itallicfont,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              // Animated Typewriter Text with Line Break and Loop
              SizedBox(
                height: 60,
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Explore, Preserve, Empower–\nVirtually Anywhere",
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontFamily: itallicfont,
                        fontWeight: FontWeight.bold,
                        color: darktheme,
                      ),
                      textAlign: TextAlign.center, // Center-align the text
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  repeatForever: true, // Enable infinite loop
                ),
              ),
              const SizedBox(height: 50),
              // Use an Expanded widget to fill space between content and button
              Expanded(child: Container()),

              // Get Started Button aligned to the bottom
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20), // Adjust vertical padding as needed
                child: ElevatedButton(
                  onPressed: () {
                    Get.off(()=>ChooseAvatarScreen());
                    // Navigate to the next screen
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4B5945),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
