import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Widgets/Explore/EventCardWidget.dart';
import 'package:heritage/Widgets/HomePageWidgets/BestLocWidget.dart';
import 'package:heritage/Widgets/HomePageWidgets/VirtualTourWidget.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF4B5945),
              ),
              
              accountName: const Text(
                "SAGAR TOETIA",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              accountEmail: const Text(
                "example@heritagesphere.com",
                style: TextStyle(color: Colors.white70),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "S",
                  style: TextStyle(
                    fontSize: 36.0,
                    color: Color(0xFF4B5945),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.black),
              title: const Text("Profile"),
              onTap: () {
                // Handle profile action
              },
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.black),
              title: const Text("Notifications"),
              onTap: () {
                // Handle notifications action
              },
            ),
            ListTile(
              leading: const Icon(Icons.palette, color: Colors.black),
              title: const Text("Change Theme"),
              onTap: () {
                // Handle theme change
              },
            ),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.black),
              title: const Text("Change Language"),
              onTap: () {
                // Handle language change
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.black),
              title: const Text("Settings"),
              onTap: () {
                // Handle settings
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () {
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text(
              "HeritageSphere",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: const Color(0xFF4B5945),
            expandedHeight: 190.0,
            floating: false,
            pinned: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  margin: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.menu, color: Colors.black),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                );
              },
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                margin: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.black),
                  onPressed: () {
                    // Handle notification action
                  },
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 64.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    SizedBox(
                      height: 30,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Good Morning 👋',
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                      ),
                    ),
                    const Text(
                      "SAGAR TOETIA",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: homeBg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const VitualTourWidget(),
                  const SizedBox(height: 20),
                  HeritageSphereWidget(),
                  const SizedBox(height: 20),
                  feedeventCardNearby(),
                  const SizedBox(height: 40),

                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
