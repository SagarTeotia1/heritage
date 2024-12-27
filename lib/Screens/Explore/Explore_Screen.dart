import 'package:flutter/material.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Screens/Explore/Feed_Screen.dart';
import 'package:heritage/Screens/Explore/MetaVerse_Screen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        backgroundColor: homeBg,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Colors.transparent,
            child: TabBar(
              controller: _tabController,
              indicatorColor: const Color.fromARGB(100, 75, 89, 69),
              labelColor: const Color(0xFF4B5945),
              unselectedLabelColor: Colors.grey,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Stories'),
                Tab(text: 'Explore'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          FeedScreen(),  // Assuming FeedScreen has its own scrollable behavior
          MetaverseScreen(),  // Assuming MetaverseScreen has its own scrollable behavior
        ],
      ),
    );
  }
}
