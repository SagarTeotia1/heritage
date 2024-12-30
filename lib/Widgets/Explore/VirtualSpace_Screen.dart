import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heritage/Const/const_colo.dart';
import 'package:heritage/Const/const_img.dart';
import 'package:heritage/Screens/Home/Home_Screen.dart';
import 'package:url_launcher/url_launcher.dart';


class VirtualTourScreen extends StatelessWidget {
  final String placeId;

  const VirtualTourScreen({Key? key, required this.placeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, TourData> toursConfig = {
      "eiffel_tower": TourData(
        title: "Eiffel Tower",
        location: "Paris, France",
        description:
            "The Eiffel Tower is a global cultural icon of France and one of the most recognizable structures in the world. Standing tall at 330 meters, it offers breathtaking views of Paris and an unforgettable experience for visitors.",
        image: effiletower,
        sustainability: 0.9,
        reviews: 4.5,
        metaverseLink:
            "https://www.spatial.io/s/Greedys-Digital-Area-67717d4a9eedffff177b0094?share=8625607098453655085",
      ),
      "taj_mahal": TourData(
        title: "Taj Mahal",
        location: "Agra, India",
        description:
            "The Taj Mahal, a UNESCO World Heritage Site, is an ivory-white marble mausoleum built in the 17th century. It symbolizes eternal love and is a testament to Mughal architectural brilliance.",
        image: "assets/images/Tajmahal.jpg",
        sustainability: 0.8,
        reviews: 4.8,
        metaverseLink:
            "https://www.spatial.io/s/Greedys-Hi-Fi-Space-67717adf909e4ff602cef3b6?share=9127912238640186084",
      ),
      "qutub_minar": TourData(
        title: "Qutub Minar",
        location: "Delhi, India",
        description:
            "Qutub Minar is a towering UNESCO World Heritage Site in Delhi. Built in the early 13th century, it is one of the finest examples of Indo-Islamic architecture.",
        image: "assets/images/Qutub Minar.jpg",
        sustainability: 0.85,
        reviews: 4.7,
        metaverseLink:
            "https://www.spatial.io/s/Greedys-Hi-Fi-Space-67717adf909e4ff602cef3b6?share=9127912238640186084",
      ),
      "pyramid": TourData(
        title: "The Pyramids",
        location: "Giza, Egypt",
        description:
            "The Great Pyramids of Giza are ancient marvels of engineering and architectural prowess, standing as a testament to the grandeur of ancient Egypt.",
        image: "assets/images/piyramid.jpg",
        sustainability: 0.95,
        reviews: 4.9,
        metaverseLink:
            "https://www.spatial.io/s/Greedys-Digital-Area-67717d4a9eedffff177b0094?share=8625607098453655085",
      ),
    };

    final tourData = toursConfig[placeId] ??
        TourData(
          title: "Unknown Place",
          location: "Unknown Location",
          description: "No information available for this place.",
          image: "assets/images/default.jpg",
          sustainability: 0.0,
          reviews: 0.0,
          metaverseLink: "",
        );

    return VirtualTourDetailsScreen(tourData: tourData);
  }
}

class VirtualTourDetailsScreen extends StatelessWidget {
  final TourData tourData;

  const VirtualTourDetailsScreen({Key? key, required this.tourData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: homeBg,
      appBar: AppBar(
        title: Text(tourData.title),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.off(() => const HomeScreen());
          },
        ),
      ),
      body: isLandscape
          ? Row(
              children: [
                Flexible(flex: 1, child: ImageSection(image: tourData.image)),
                Flexible(flex: 2, child: DetailsSection(tourData: tourData)),
              ],
            )
          : Column(
              children: [
                ImageSection(image: tourData.image),
                Expanded(
                  child: SingleChildScrollView(
                    child: DetailsSection(tourData: tourData),
                  ),
                ),
              ],
            ),
    );
  }
}

class ImageSection extends StatelessWidget {
  final String image;

  const ImageSection({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Image.asset('assets/images/default.jpg'), // Fallback image
          ),
        ),
      ),
    );
  }
}

class DetailsSection extends StatelessWidget {
  final TourData tourData;

  const DetailsSection({Key? key, required this.tourData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tourData.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    tourData.location,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
              SustainabilityWidget(percentage: tourData.sustainability),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              ...List.generate(
                5,
                (index) => Icon(
                  index < tourData.reviews.round()
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                  size: 18,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "(${tourData.reviews.toStringAsFixed(1)})",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tourData.description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse(tourData.metaverseLink))) {
                  await launchUrl(Uri.parse(tourData.metaverseLink));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Unable to open link")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: homeBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Explore in Metaverse",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TourData {
  final String title;
  final String location;
  final String description;
  final String image;
  final double sustainability;
  final double reviews;
  final String metaverseLink;

  TourData({
    required this.title,
    required this.location,
    required this.description,
    required this.image,
    required this.sustainability,
    required this.reviews,
    required this.metaverseLink,
  });
}

class SustainabilityWidget extends StatelessWidget {
  final double percentage;

  const SustainabilityWidget({Key? key, required this.percentage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(
                value: percentage,
                backgroundColor: Colors.grey[300],
                color: Colors.green,
                strokeWidth: 4,
              ),
            ),
            Text(
              "${(percentage * 100).toInt()}%",
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          "Sustainability",
          style: TextStyle(fontSize: 10, color: Colors.black),
        ),
        const Text(
          "Rating",
          style: TextStyle(fontSize: 10, color: Colors.black),
        ),
      ],
    );
  }
}
