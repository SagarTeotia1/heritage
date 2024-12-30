import 'package:flutter/material.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Widgets/Explore/VirtualSpaceWiget.dart';
import 'package:heritage/Widgets/HomePageWidgets/VirtualTourWidget.dart';

class MetaverseScreen extends StatefulWidget {
  const MetaverseScreen({super.key});

  @override
  State<MetaverseScreen> createState() => _MetaverseScreenState();
}

class _MetaverseScreenState extends State<MetaverseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        itemCount: 2, // Adjust based on how many widgets you want or dynamically load
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                VirtualSpaceWidget(),
  
              ],
            ), // Displaying the widget here
          );
        },
      ),
    );
  }
}
