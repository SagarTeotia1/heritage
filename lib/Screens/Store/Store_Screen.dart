import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Const/const_img.dart';
import 'package:heritage/Screens/Store/Regional_StoreScreen.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  // Locations data
  final List<Map<String, String?>> locations = [
    {"name": "Jaipur", "image": 'assets/images/jaipur.jpg'},
    {"name": "Paris", "image": effiletower},
    {"name": "Kyoto", "image": 'assets/images/Kyoto.jpg'},
    {"name": "Turkey", "image": 'assets/images/turkey.jpg'},
    {"name": "Peru", "image": 'assets/images/PERU.jpg'},
    {"name": "View More", "image": 'assets/images/foward.png'},
  ];

  // Recommended items data with description
final List<Map<String, String?>> recommendedItems = [
    {"title": "Japanese Kimono", "image": 'assets/images/kinomono.jpg', "description": "A luxurious silk kimono with intricate hand-painted designs."},
    {"title": "Italian Leather Wallet", "image": 'assets/images/ITALYWALLET.jpg', "description": "Premium Italian leather wallet, known for its elegance and durability."},
    {"title": "Brazilian Amazonian Handicrafts", "image": 'assets/images/BRAZILIAN.jpg', "description": "Handmade crafts from the Brazilian Amazon, made with natural materials."},
    {"title": "Indian Wooden Handicrafts", "image": 'assets/images/INDIANHANDI.jpg', "description": "Intricate wooden carvings reflecting India's cultural and spiritual heritage."},
    {"title": "French Antiques", "image": 'assets/images/FRENCHANTI.jpg', "description": "Vintage French furniture and decorative items with Baroque and Rococo styles."},
    {"title": "Peruvian Alpaca Wool Sweater", "image": 'assets/images/PWOOLEN.jpg', "description": "Soft alpaca wool sweaters with traditional Incan designs."},
    
  ];

  final List<String> categories = ["All", "Food", "Clothes", "Crafts"];
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Regional Store",
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            tooltip: "Search",
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _filterBar(),
              const SizedBox(height: 12),
              _locationsSection(),
              const SizedBox(height: 24),
              _recommendedItemsSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Filter Bar Widget
  Widget _filterBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: categories.map((category) {
        final isSelected = selectedCategory == category;
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedCategory = category;
            });
          },
          child: Chip(
            label: Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            backgroundColor: isSelected ? const Color(0xFF66785F) : Colors.grey.shade200,
          ),
        );
      }).toList(),
    );
  }

  // Locations Section Widget
  Widget _locationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Browse by Location",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: locations.length,
            itemBuilder: (context, index) {
              String? locationName = locations[index]["name"];
              String? imagePath = locations[index]["image"];
              if (locationName != null && imagePath != null) {
                return _locationCard(locationName, imagePath);
              } else {
                return SizedBox.shrink(); // Or handle this case as needed
              }
            },
          ),
        ),
      ],
    );
  }

  // Recommended Items Section Widget
  Widget _recommendedItemsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recommended Items",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 12),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recommendedItems.length,
          itemBuilder: (context, index) {
            String? title = recommendedItems[index]["title"];
            String? imagePath = recommendedItems[index]["image"];
            String? description = recommendedItems[index]["description"];
            if (title != null && imagePath != null && description != null) {
              return _recommendedItemCard(title, imagePath, description);
            } else {
              return SizedBox.shrink(); // Or handle this case as needed
            }
          },
        ),
      ],
    );
  }

  // Widget for a single location card
  Widget _locationCard(String location, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (location != "View More") {
          Get.off(() => RegionalStorescreen(region: location));
        } else {
          print("View More tapped!");
        }
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                imagePath,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              location,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for a single recommended item card
  Widget _recommendedItemCard(String title, String imagePath, String description) {
    return GestureDetector(
      onTap: () {
        print('Clicked on $title');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
