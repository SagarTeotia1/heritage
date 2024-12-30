import 'package:flutter/material.dart';

class Regionalstoreview extends StatefulWidget {
  const Regionalstoreview({super.key});

  @override
  State<Regionalstoreview> createState() => _RegionalstoreviewState();
}

class _RegionalstoreviewState extends State<Regionalstoreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitor Stories & Reviews"),
        centerTitle: true, // Center the AppBar title
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Add padding for overall content
          child: Column(
            children: [
              // Heading for the reviews section, center-aligned
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Visitor Stories & Reviews",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center, // Center align the heading
                ),
              ),
              // Scrollable row of story/review cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    regionalreviewCard(
                      title: "A Mesmerizing Journey",
                      visitorName: "John Doe",
                      profileImage: 'assets/logo.png', // Replace with actual image path
                      reviewText: "Exploring the Taj Mahal was a once-in-a-lifetime experience!",
                      imagePath: 'assets/images/TajTour.jpg', // Replace with actual image path
                      onTap: () => print("Card tapped: A Mesmerizing Journey"),
                    ),
                    regionalreviewCard(
                      title: "Unforgettable Memories",
                      visitorName: "Jane Smith",
                      profileImage: 'assets/logo.png', // Replace with actual image path
                      reviewText: "Walking under the Eiffel Tower was magical!",
                      imagePath: 'assets/images/effile trip.jpg', // Replace with actual image path
                      onTap: () => print("Card tapped: Unforgettable Memories"),
                    ),
                    regionalreviewCard(
                      title: "Historical Wonders",
                      visitorName: "Alex Johnson",
                      profileImage: 'assets/logo.png', // Replace with actual image path
                      reviewText: "The Great Pyramid of Giza left me speechless.",
                      imagePath: 'assets/images/pyramidtrip.jpg', // Replace with actual image path
                      onTap: () => print("Card tapped: Historical Wonders"),
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

  Widget regionalreviewCard({
    required String title,
    required String visitorName,
    required String profileImage,
    required String reviewText,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 250, // Fixed width for consistency
          height: 320, // Adjusted height for better layout
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
}
