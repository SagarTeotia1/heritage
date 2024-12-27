import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Screens/Explore/Explore_Screen.dart';
import 'package:heritage/Screens/Guide/Guide_Screen.dart';
import 'package:heritage/Screens/HomePage/HomePage_Screen.dart';
import 'package:heritage/Screens/Profile/Profile_Screen.dart';
import 'package:heritage/Screens/Store/Store_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Define a list of widgets (pages) to show based on the index
  final List<Widget> _pages = [
    HomepageScreen(),
    ExploreScreen(),
    GuideScreen(),
    StoreScreen(),
    ProfileScreen(),
    
  ];

  // Initially set to 0, meaning the first page will be shown
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _navigationItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.explore_rounded, 'label': 'Explore'},
    {'icon': Icons.assignment_ind, 'label': ' Guide '},
    {'icon': Icons.store, 'label': 'Store'},
    {'icon': Icons.person, 'label': 'You'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg, // Use your color constant for the background
      body: _pages[_currentIndex], // Display the current page based on the selected index
      bottomNavigationBar: CurvedNavigationBar(
        items: _navigationItems
            .map(
              (item) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(item['icon'], color: Colors.black),
                  const SizedBox(height: 4), // Spacing between icon and label
                  Text(
                    item['label'],
                    style: TextStyle(
                      fontSize: 8,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
            .toList(),
        backgroundColor: homeBg, // Make the background transparent
        color: Colors.white, // Color of the navigation bar
        buttonBackgroundColor:
            const Color.fromARGB(255, 247, 247, 247), // Central icon button background
        animationDuration: const Duration(milliseconds: 300),
        height: 70, // Adjusted height to accommodate labels
        index: _currentIndex, // This ensures the correct icon is highlighted
        onTap: (index) {
          setState(() {
            // Update the current index and display the corresponding page
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
