import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/Const/const_img.dart';
import 'package:heritage/Screens/Store/Regional_StoreScreen.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final List<String> locations = [
    "New York",
    "Paris",
    "Tokyo",
    "Cairo",
    "Sydney",
    "Rio",
  ];

  final List<Map<String, String>> recommendedItems = [
    {"title": "Special Food 1", "image": logo},
    {"title": "Cultural Dress 2", "image": logo},
    {"title": "Local Craft 3", "image": logo},
    {"title": "Unique Jewelry 4", "image": logo},
    {"title": "Handmade Bag 5", "image": logo},
    {"title": "Exotic Spices 6", "image": logo},
    {"title": "Traditional Art 7", "image": logo},
  ];

  final List<String> categories = ["All", "Food", "Clothes", "Crafts"];

  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Regional Store",
          style: TextStyle(
            color: const Color(0xFF66785F),
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
              // Filter Bar
              _filterBar(),

              const SizedBox(height: 12),

              // Locations Section
              const Text(
                "Browse by Location",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    return _locationCard(locations[index]);
                  },
                ),
              ),
              const SizedBox(height: 24),

              // Recommended Items Section
              const Text(
                "Recommended Items",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recommendedItems.length,
                itemBuilder: (context, index) {
                  return _recommendedItemCard(
                    recommendedItems[index]["title"]!,
                    recommendedItems[index]["image"]!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for the Filter Bar
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
            backgroundColor: isSelected ? Colors.green : Colors.grey.shade200,
          ),
        );
      }).toList(),
    );
  }

  // Widget for a single location card
  Widget _locationCard(String location) {
    return GestureDetector(
      onTap: () {
        Get.off(() => RegionalStorescreen(region: location));
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
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
                logo, // Placeholder for dynamic images
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              location,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for a single recommended item card
  Widget _recommendedItemCard(String title, String imagePath) {
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
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Explore regional specialty",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
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
