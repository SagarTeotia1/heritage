import 'package:flutter/material.dart';

class RegionalLocCard extends StatelessWidget {
  final String location;
  const RegionalLocCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cardSize = MediaQuery.of(context).size.width * 0.25;

    return GestureDetector(
      onTap: () {
        print('Selected Location: $location');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // Circular image
                ClipOval(
                  child: Image.asset(
                    'assets/images/$location.jpg', // Replace with your image path
                    width: cardSize,
                    height: cardSize,
                    fit: BoxFit.cover,
                  ),
                ),
                // Circular border
                Container(
                  width: cardSize,
                  height: cardSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 3,
                    ),
                  ),
                ),
                // Text overlay
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: cardSize,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    color: Colors.black.withOpacity(0.5),
                    child: Text(
                      location,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
