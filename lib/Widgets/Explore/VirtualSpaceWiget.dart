import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/Const/const_fonts.dart';
import 'package:heritage/Const/const_img.dart'; // Replace with actual image paths
import 'package:heritage/Widgets/Explore/VirtualSpace_Screen.dart';

class VirtualSpaceWidget extends StatelessWidget {
  // List of virtual tour places with image paths, titles, and screen identifiers
  final List<Map<String, String>> virtualTourPlaces = [
    {
      "image": 'assets/images/Tajmahal.jpg', // Image path for Taj Mahal
      "title": "Explore Taj Mahal",
      "screen": "taj_mahal", // Unique identifier for the Taj Mahal screen
    },
    {
      "image":
          effiletower, // Image path for Eiffel Tower (Ensure you have a valid path for this)
      "title": "Explore Eiffel Tower",
      "screen": "eiffel_tower", // Unique identifier for the Eiffel Tower screen
    },
    {
      "image": 'assets/images/Qutub Minar.jpg', // Image path for Qutub Minar
      "title": "Explore Qutub Minar",
      "screen": "qutub_minar", // Unique identifier for the Qutub Minar screen
    },
    {
      "image": 'assets/images/piyramid.jpg', // Image path for Pyramid
      "title": "Explore Pyramid",
      "screen": "pyramid", // Unique identifier for the Pyramid screen
    },
    // Add more places with unique screen identifiers as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 20), // Padding for the entire widget
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: virtualTourPlaces.map((place) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20), // Space between items
            child: Container(
              width: double.infinity, // Full width of the parent container
              height: 150, // Fixed height for each container
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    20), // Rounded corners for each container
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    20), // Clip the image within rounded corners
                child: Stack(
                  children: [
                    // Background image
                    Positioned.fill(
                      child: Image.asset(
                        place["image"]!, // Dynamically load image path
                        fit: BoxFit
                            .cover, // Ensure the image covers the entire container
                      ),
                    ),
                    // Title text
                    Positioned(
                      top: 20,
                      left: 10,
                      right: 10,
                      child: Text(
                        place["title"]!,
                        style: TextStyle(
                          fontFamily: regularfont,
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black.withOpacity(0.7),
                              offset: Offset(4.0, 4.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Custom Explore Button
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: _buildExploreButton(context, place),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildExploreButton(BuildContext context, Map<String, String> place) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to VirtualTourScreen with a specific identifier for the place
        Get.to(
          () => VirtualTourScreen(
              placeId: place[
                  "screen"]!), // Fixed the parameter to match VirtualTourScreen constructor
        );
        print("Exploring: ${place['title']}");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFB2C9AD), // Green color button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded button
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
        minimumSize: Size(90, 40), // Small button size
      ),
      child: Text(
        "Explore",
        style: TextStyle(
          color: Colors.white, // White text on the button
          fontSize: 11,
        ),
      ),
    );
  }
}
