import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Screens/Explore/Feed_Screen.dart';
import 'package:heritage/Screens/Explore/MetaVerse_Screen.dart';
import 'package:heritage/Screens/Home/Home_Screen.dart';

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
    // Initializing TabController with 2 tabs
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Disposing TabController when the widget is disposed
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        backgroundColor: Colors.white,  // Assuming homeBg is defined in your constants
        leading: IconButton(
          onPressed: () {
            // Implement the back navigation here
            Get.off(()=>HomeScreen());
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Placeholder for search functionality
              // You can implement search screen or dialog here
              showSearch(context: context, delegate: CustomSearchDelegate());
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
                Tab(text: 'Virtual Space'),
                Tab(text: 'Plan'),
                
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          MetaverseScreen(),
          FeedScreen(), 
          
        ],
      ),
    );
  }
}

// Custom search delegate (if you want to implement search functionality)
class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search when back is pressed
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // You can implement your search results here
    return Center(child: Text('Search results for: $query'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can implement your search suggestions here
    return ListView.builder(
      itemCount: 10, // Example: 10 suggestions
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Suggestion #$index'),
          onTap: () {
            query = 'Suggestion #$index'; // Update query based on suggestion
            showResults(context);
          },
        );
      },
    );
  }
}
