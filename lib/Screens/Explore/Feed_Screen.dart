import 'package:flutter/material.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Widgets/Explore/EventCardWidget.dart';
import 'package:heritage/Widgets/HomePageWidgets/BestLocWidget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        itemCount: 2, // Specify how many items you want, can be dynamic if needed
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              children: [
                HeritageSphereWidget(),
                const SizedBox(height: 10),
                feedeventCardNearby(),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add functionality for "Plan Trip with AI" here
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("AI Trip Planner"),
              content: const Text("This feature is coming soon!"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        },
        backgroundColor: const Color(0xFF4B5945),
        icon: const Icon(Icons.explore, color: Colors.white),
        label: const Text(
          "Plan Trip with Guide",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
