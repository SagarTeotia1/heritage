import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/Const/const_colo.dart'; // Ensure this file has `homeBg`
import 'package:heritage/Const/const_img.dart'; // Ensure this file has `logo`
import 'package:heritage/Screens/Explore/Explore_Screen.dart';
import 'package:heritage/Screens/Home/Home_Screen.dart';
import 'package:heritage/Screens/Store/Store_Screen.dart';

class RegionalStorescreen extends StatefulWidget {
  final String region;

  const RegionalStorescreen({super.key, required this.region});

  @override
  State<RegionalStorescreen> createState() => _RegionalStorescreenState();
}

class _RegionalStorescreenState extends State<RegionalStorescreen> {
  // Mock data for the regional items
  final List<Map<String, String>> regionalItems = [
    {
      "name": "Handcrafted Pottery",
      "image": logo, // Ensure `logo` is defined
      "description": "Beautiful handcrafted pottery unique to this region."
    },
    {
      "name": "Traditional Weaves",
      "image": logo,
      "description": "Exquisite traditional weaving styles."
    },
    {
      "name": "Regional Spices",
      "image": logo,
      "description": "Flavorful spices sourced locally."
    },
    {
      "name": "Folk Art",
      "image": logo,
      "description": "Intricate folk art representing the region's culture."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      appBar: AppBar(
        title: Text(widget.region),
        backgroundColor: homeBg,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.off(() => const HomeScreen());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8, // Adjust card height
          ),
          itemCount: regionalItems.length,
          itemBuilder: (context, index) {
            final item = regionalItems[index];
            return RegionalItemCard(
              name: item['name']!,
              image: item['image']!,
              description: item['description']!,
            );
          },
        ),
      ),
    );
  }
}

class RegionalItemCard extends StatelessWidget {
  final String name;
  final String image;
  final String description;

  const RegionalItemCard({
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailScreen(

            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDetailScreen extends StatelessWidget {


 @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: homeBg,
      body: isLandscape
          ? Row(
              children: [
                // Image Section
                Flexible(
                  flex: 1,
                  child: Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(30),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              logo, // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Top Buttons (Back and Bookmark)
                          Positioned(
                            top: 16,
                            left: 16,
                            child: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () {
                                  Get.off(()=>HomeScreen());// Navigate back
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              child: IconButton(
                                icon: const Icon(Icons.bookmark_border, color: Colors.white),
                                onPressed: () {
                                  print('Bookmark clicked');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Details Section
                Flexible(
                  flex: 2,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: DetailsSection(),
                  ),
                ),
              ],
            )
          : Column(
              children: [
                // Top Image Container
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              logo, // Replace with your image path
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Top Buttons (Back and Bookmark)
                          Positioned(
                            top: 16,
                            left: 16,
                            child: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: () {
                                  Get.off(()=>HomeScreen());// Navigate back
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: 16,
                            right: 16,
                            child: CircleAvatar(
                              backgroundColor: Colors.black.withOpacity(0.5),
                              child: IconButton(
                                icon: const Icon(Icons.bookmark_border, color: Colors.white),
                                onPressed: () {
                                  print('Bookmark clicked');
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Details Section
                Expanded(
                  child: SingleChildScrollView(
                    child: DetailsSection(),
                  ),
                ),
              ],
            ),
    );
  }
}

// Details Section extracted for reuse
class DetailsSection extends StatelessWidget {
  const DetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Location, Title, and Sustainability
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Eiffel Tower",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Paris, France",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SustainabilityWidget(percentage: 0.9), // Aligned Sustainability Widget
            ],
          ),
          const SizedBox(height: 16),
          // Reviews Section
          Row(
            children: const [
              Icon(Icons.star, color: Colors.yellow, size: 20),
              SizedBox(width: 4),
              Text(
                "4.8 (147 Reviews)",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Features
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _FeatureIcon(icon: Icons.wifi, label: "Wi-Fi"),
              _FeatureIcon(icon: Icons.ac_unit, label: "AC"),
              _FeatureIcon(icon: Icons.local_parking, label: "Parking"),
              _FeatureIcon(icon: Icons.restaurant, label: "Restaurant"),
              _FeatureIcon(icon: Icons.pool, label: "Pool"),
            ],
          ),
          const SizedBox(height: 16),
          // Description
          const Text(
            "The Eiffel Tower is a global cultural icon of France and one of the most recognizable structures in the world. Standing tall at 330 meters, it offers breathtaking views of Paris and an unforgettable experience for visitors. Whether you're visiting during the day or enjoying the sparkling lights at night, the Eiffel Tower is a must-see destination.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          // Explore in Metaverse Button
          ElevatedButton(
            onPressed: () {
              Get.off(()=>ExploreScreen());
              // Navigate to Metaverse screen
              print("Navigate to Metaverse");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: bgcolor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Explore in Metaverse",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// Feature Icon Widget
class _FeatureIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FeatureIcon({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[200],
          child: Icon(icon, color: Colors.black),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    );
  }
}

// Sustainability Widget
class SustainabilityWidget extends StatelessWidget {
  final double percentage;

  const SustainabilityWidget({Key? key, required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                value: percentage,
                backgroundColor: Colors.grey[300],
                color: Colors.green,
                strokeWidth: 4,
              ),
            ),
            Text(
              "${(percentage * 100).toInt()}%",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          "Sustainability",
          style: TextStyle(fontSize: 10, color: Colors.black),
        ),
        const Text(
          "Rating",
          style: TextStyle(fontSize: 10, color: Colors.black),
        ),
      ],
    );
  }
}
