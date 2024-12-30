import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/Const/const_fonts.dart';
import 'package:heritage/Const/const_img.dart';
import 'package:heritage/Widgets/Explore/VirtualTour_Screen.dart';

class VitualTourWidget extends StatefulWidget {
  const VitualTourWidget({Key? key}) : super(key: key);

  @override
  _VitualTourWidgetState createState() => _VitualTourWidgetState();
}

class _VitualTourWidgetState extends State<VitualTourWidget> {
  // You can add any state-related properties here if needed
  bool isExploring = false;  // For example, you could track if the user is exploring

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20), // Padding from left and right
      child: Container(
        width: double.infinity,  // Allow the container to stretch horizontally within the padding
        height: 150,  // Fixed height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),  // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(  // Clip the image to the rounded corners
          borderRadius: BorderRadius.circular(20),  // Same radius as the container for consistent rounded edges
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.asset(
                  effiletower,  // Replace with your actual image path
                  fit: BoxFit.cover,  // Ensures the image covers the whole area and gets cropped
                ),
              ),
              // Text over the image
              Positioned(
                top: 20,  // Adjust position from the top
                left: 10,
                right: 10,
                child: Text(
                  "Explore Virtual Site",
                  style: TextStyle(
                    fontFamily: regularfont,
                    color: Colors.white,
                    fontSize: 11,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.7),
                        offset: Offset(4.0, 4.0),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              // Button over the image, aligned to the left
              Positioned(
                bottom: 10,  // Adjust position from the bottom
                right: 10,  // Align the button to the left
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isExploring = !isExploring;  // Toggle state on press
                    });

                    // Navigate to VirtualTourScreen when the button is pressed
                    Get.off(() => VirtualtourScreen());
                    // Add the action for the button here
                    print("Explore Virtual Tour!");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFB2C9AD),  // Set button background color to the green shade (B2C9AD)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),  // Rounded corners for the button
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10),  // Vertical padding for button size
                    minimumSize: Size(90, 40),  // Set explicit width (small button)
                  ),
                  child: Text(
                    "Explore",
                    style: TextStyle(
                      color: Colors.white,  // White text on the button
                      fontSize: 11,
                    ),
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
