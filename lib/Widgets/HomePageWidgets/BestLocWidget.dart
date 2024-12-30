import 'package:flutter/material.dart';
import 'package:heritage/Const/const_fonts.dart';
import 'package:heritage/Const/const_img.dart';

class HeritageSphereWidget extends StatelessWidget {
  final List<Map<String, String>> heritageSites = [
    {
      "imagePath": 'assets/images/Tajmahal.jpg',
      "locationName": "Taj Mahal",
      "description": "A symbol of love and Mughal architecture.",
    },
    {
      "imagePath": effiletower,
      "locationName": "Eiffel Tower",
      "description": "An iconic wrought-iron lattice tower in Paris, France.",
    },
    {
      "imagePath": "assets/images/Qutub Minar.jpg",
      "locationName": "Qutub Minar",
      "description": "A towering minaret in Delhi, India, built in the 12th century.",
    },
    {
      "imagePath": "assets/images/piyramid.jpg",
      "locationName": "Great Pyramid of Giza",
      "description": "The oldest of the Seven Wonders of the Ancient World in Egypt.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Heritage Sites",
                style: TextStyle(
                  fontFamily: boldfont,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                size: 20,
                color: Colors.black,
              ),
            ],
          ),
        ),
        // Row of heritage site cards
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...heritageSites.map((site) {
                return HeritageSiteCard(
                  imagePath: site["imagePath"]!,
                  locationName: site["locationName"]!,
                  description: site["description"]!,
                );
              }).toList(),
              // View More Button as TextButton
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to detailed page or show additional sites
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MoreHeritageSitesPage(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 150,
                    height: 200,
                    child: Center(
                      child: Text(
                        "View More",
                        style: TextStyle(
                          fontFamily: boldfont,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HeritageSiteCard extends StatelessWidget {
  final String imagePath;
  final String locationName;
  final String description;

  HeritageSiteCard({
    required this.imagePath,
    required this.locationName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 150,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Background image
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                // Semi-transparent overlay
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
                // Content: Title and description
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locationName,
                        style: TextStyle(
                          fontFamily: boldfont,
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // Like button
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Color(0xFF91AC8F),
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MoreHeritageSitesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("More Heritage Sites"),
      ),
      body: Center(
        child: Text(
          "Additional heritage sites coming soon!",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
