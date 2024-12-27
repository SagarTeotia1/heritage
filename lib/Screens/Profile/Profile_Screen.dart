import 'package:flutter/material.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Const/const_img.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String userName = "Alex Smith";
  final String userEmail = "alex.smith@example.com";
  final int heritageSitesVisited = 12;
  final double ecoIncentiveProgress = 0.6;
  final double metaverseExplorationProgress = 0.8;

  final List<Map<String, String>> achievements = [
    {"title": "Eco Champion", "date": "2024-12-05"},
    {"title": "Virtual Explorer", "date": "2024-11-28"},
    {"title": "Cultural Curator", "date": "2024-10-15"},
  ];

  final List<Map<String, String>> recentActivities = [
    {"action": "Explored the Great Wall in Metaverse", "date": "2024-12-20"},
    {"action": "Visited Taj Mahal with AR guide", "date": "2024-12-15"},
    {"action": "Purchased eco-friendly artisan products", "date": "2024-12-10"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: constraints.maxWidth > 600 ? constraints.maxHeight * 0.35 : constraints.maxHeight * 0.3,
                  pinned: true,
                  backgroundColor: const Color(0xFF66785F),
                  flexibleSpace: FlexibleSpaceBar(

                    background: _buildAppBarBackground(constraints),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      _buildProgressCard(
                        context,
                        title: "Heritage Sites Visited",
                        progress: metaverseExplorationProgress,
                        label: "12 sites explored in Metaverse",
                        icon: Icons.location_on_outlined,
                      ),
                      _buildSectionCard(
                        context,
                        title: "Achievements",
                        items: achievements,
                        icon: Icons.emoji_events,
                      ),
                      _buildSectionCard(
                        context,
                        title: "Recent Activities",
                        items: recentActivities,
                        icon: Icons.history,
                      ),
                      _buildActionButtons(),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppBarBackground(BoxConstraints constraints) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  userEmail,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                _buildCircularProgress(),
              ],
            ),
          ),
          const SizedBox(width: 20),
          CircleAvatar(
            radius: constraints.maxWidth > 600 ? 50 : 40,
            backgroundImage: AssetImage(logo),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularProgress() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: ecoIncentiveProgress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4B5945)),
                strokeWidth: 6.0,
              ),
              const Icon(
                Icons.eco,
                color: Color(0xFF4B5945),
                size: 20,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Eco Level 3",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sustainability Enthusiast",
                  style: TextStyle(fontSize: 8, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCard(BuildContext context,
      {required String title,
      required double progress,
      required String label,
      required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF91AC8F),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              color: const Color(0xFF4B5945),
              minHeight: 8,
            ),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(BuildContext context,
      {required String title,
      required List<Map<String, String>> items,
      required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFB2C9AD),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...items.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item["title"] ?? item["action"]!,
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    Text(
                      item["date"]!,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.settings),
            label: const Text("Settings"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.logout),
            label: const Text("Logout"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
