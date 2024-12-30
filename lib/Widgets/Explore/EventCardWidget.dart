import 'package:flutter/material.dart';
import 'package:heritage/Const/const_fonts.dart';
import 'package:heritage/Const/const_img.dart'; // Replace with your correct imports

Widget feedeventCardNearby() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Heading for the reviews section
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          "Visitor Stories & Reviews",
          style: TextStyle(
            fontFamily: boldfont,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      // Scrollable row of story/review cards
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Example review/story cards
            reviewCard(
              title: "A Mesmerizing Journey",
              visitorName: "John Doe",
              profileImage: logo,
              reviewText: "Exploring the Taj Mahal was a once-in-a-lifetime experience!",
              imagePath: 'assets/images/TajTour.jpg',
              onTap: () => print("Card tapped: A Mesmerizing Journey"),
            ),
            reviewCard(
              title: "Unforgettable Memories",
              visitorName: "Jane Smith",
              profileImage: logo,
              reviewText: "Walking under the Eiffel Tower was magical!",
              imagePath: 'assets/images/effile trip.jpg',
              onTap: () => print("Card tapped: Unforgettable Memories"),
            ),
            reviewCard(
              title: "Historical Wonders",
              visitorName: "Alex Johnson",
              profileImage: logo,
              reviewText: "The Great Pyramid of Giza left me speechless.",
              imagePath: 'assets/images/pyramidtrip.jpg',
              onTap: () => print("Card tapped: Historical Wonders"),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget reviewCard({
  required String title,
  required String visitorName,
  required String profileImage,
  required String reviewText,
  required String imagePath,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 250, // Fixed width for consistency
        height: 300, // Fixed height for consistency
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey[300]!,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // Background image for the story card
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 140, // Fixed height for the image
                  ),
                ),
                // Bookmark Icon
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    Icons.bookmark,
                    color: Color(0xFF91AC8F),
                    size: 24,
                  ),
                ),
              ],
            ),
            // Title and review text wrapped in a Flexible widget
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Story/Review Title
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
                    // Visitor's review text
                    Expanded(
                      child: Text(
                        reviewText,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Visitor Profile Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  SizedBox(width: 10),
                  Text(
                    visitorName,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
