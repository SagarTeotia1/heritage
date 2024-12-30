import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/Const/const_colo.dart'; // Use Jaipur-inspired colors
import 'package:heritage/Const/const_img.dart'; // Use traditional Jaipur elements like images
import 'package:heritage/Screens/Explore/Explore_Screen.dart';
import 'package:heritage/Screens/Home/Home_Screen.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart'; // Correct import for model_viewer_plus

class RegionalStorescreen extends StatelessWidget {
  final String region;

  RegionalStorescreen({super.key, required this.region});

  final List<Map<String, String>> regionalItems = [
    {
      "name": "Jaipur Pottery",
      "image": 'assets/images/handcrafted_pottery_cup.glb', // Replace with actual model for Jaipur pottery
      "description": "Handcrafted pottery from the artisans of Jaipur, known for their intricate designs."
    },
    {
      "name": "Bandhej Weaves",
      "image": 'assets/images/small_dastar_weaving.glb', // Replace with actual model for Jaipur bandhej fabrics
      "description": "Traditional Bandhej fabric, known for its vibrant colors and tie-dye art."
    },
    {
      "name": "Blue Pottery",
      "image": 'assets/images/chinese_pottery_vase.glb', // Replace with actual model for Blue Pottery
      "description": "Unique and delicate blue pottery crafted by Jaipur's skilled artisans."
    },
    {
      "name": "Jaipur Jewelry",
      "image": 'assets/images/rohan_jhumka.glb', // Replace with actual model for Jaipur jewelry
      "description": "Exquisite jewelry made with the finest craftsmanship from Jaipur."
    },
    {
      "name": "Kundan Artifacts",
      "image": 'assets/images/bangles.glb', // Replace with actual model for Kundan jewelry
      "description": "Famous Kundan jewelry, a traditional art form native to Jaipur."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg, // Light Pink inspired by Jaipur's architecture
      appBar: AppBar(
        title: Text(region),
        backgroundColor: Colors.white, // Dark Pink, inspired by Jaipur's iconic color
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
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
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
        Get.to(() => ItemDetailScreen(
              name: name,
              image: image,
              description: description,
            ));
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
                child: ModelViewer(
                  src: image, // Path to the model file
                  alt: '3D Model of $name',
                  autoRotate: true,
                  cameraControls: true,
                  backgroundColor: Colors.transparent,
                  ar: true,  // Enable AR
           
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: darktheme, // Using Jaipur-inspired color
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
  final String name;
  final String image;
  final String description;

  const ItemDetailScreen({
    required this.name,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text("Jaipur"),
        backgroundColor: Colors.white, // Dark Pink, inspired by Jaipur's iconic color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: darktheme, // Light Pink inspired by Jaipur's architecture
      body: Column(
        children: [
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
                child: ModelViewer(
                  src: image,  // 3D model path
                  alt: '3D Model of $name',
                  autoRotate: true,
                  cameraControls: true,
                  backgroundColor: Colors.transparent,
                  ar: true,  // Enable AR
                  
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Jaipur-inspired color for headings
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: homeBg,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Get.off(() => ExploreScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: homeBg, // Jaipur-inspired button color
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Explore jaipur in Metaverse",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
