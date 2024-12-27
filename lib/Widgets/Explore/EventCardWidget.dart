import 'package:flutter/material.dart';
import 'package:heritage/Const/const_fonts.dart';
import 'package:heritage/Const/const_img.dart';
  // Assuming this file has your image path

Widget feedeventcardNearby() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,  // Aligns text to the start (left)
    children: [
      // Heading above the row of event boxes
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),  // Padding around the text
        child: Text(
          "Reviews",  // Text heading
          style: TextStyle(
            fontFamily: regularfont,
            fontSize: 16,  // Font size of the heading
            color: Colors.black,  // Text color
          ),
        ),
      ),
      // Row of event boxes
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,  // Makes the row scrollable horizontally
        child: Row(
          children: [
            // Box 1
            eventcardBox(),
            // Box 2
            eventcardBox(),
            // Box 3
            eventcardBox(),
            // Add more boxes as needed
          ],
        ),
      ),
    ],
  );
}

Widget eventcardBox() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),  // Space between boxes
    child: Container(
      width: 200,  // Width of each box
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),  // Rounded corners
        border: Border.all(
          color: Colors.white,  // Set border color to white
          width: 6,  // Increased border width to 6
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image in the box
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                child: Image.asset(
                  logo,  // Replace with your image path
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,  // Height of the image
                ),
              ),
              // Like Icon at the top-right corner with color updated to 91AC8F
              Positioned(
                top: 10,
                right: 10,
                child: Icon(
                  Icons.bookmark,
                  color: Color(0xFF91AC8F),  // Updated color of the like icon
                  size: 24,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),  // Space between image and text
          Padding(
            padding: const EdgeInsets.all(10), // Padding for the text (10 from all sides)
            child: Text(
              "Event Title",  // Dummy event name
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,  // Ensures the text doesn't overflow
            ),
          ),
          SizedBox(height: 8),  // Space between text and profile section
          Padding(
            padding: const EdgeInsets.all(10), // Padding for the profile section (10 from all sides)
            child: Row(
              children: [
                // Profile Icon
                CircleAvatar(
                  radius: 15,
                  backgroundImage: AssetImage(logo), // Dummy profile picture (replace with real path)
                ),
                SizedBox(width: 8),  // Space between profile icon and name
                Text(
                  "John Doe",  // Dummy name
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
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
