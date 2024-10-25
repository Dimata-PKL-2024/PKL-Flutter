import 'package:flutter/material.dart';
import '../../../models/location_model.dart';
import 'package:get/get.dart';

class LocationDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Location location = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal[700],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImageSection(location.imagePath),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleSection(location),
                  Divider(thickness: 1.5, color: Colors.teal[100]),
                  buildRatingSection(location.rating), // Pindah rating ke atas
                  buildIconSection(Icons.hotel, 'Facilities', location.facilities),
                  buildIconSection(Icons.monetization_on, 'Price', [location.price]),
                  buildIconSection(Icons.sports_handball, 'Activities', location.activities),
                  buildIconSection(Icons.rule, 'Rules', location.rules),
                  buildIconSection(Icons.wb_sunny, 'Best Season & Weather', [
                    'Best season: ${location.bestSeason}',
                    'Weather: ${location.weather}'
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImageSection(String imagePath) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Explore',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTitleSection(Location location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          location.name,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal[800]),
        ),
        SizedBox(height: 8),
        Text(
          location.description,
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget buildRatingSection(double rating) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.amber[600], size: 24),
          SizedBox(width: 8),
          Text(
            'Rating: $rating',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.teal[700]),
          ),
        ],
      ),
    );
  }

  Widget buildIconSection(IconData icon, String title, List<String> items, {bool isQuote = false}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.teal[300], size: 24),
              SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.teal[700]),
              ),
            ],
          ),
          SizedBox(height: 8),
          ...items.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                isQuote ? '"$item"' : '• $item',
                style: TextStyle(fontSize: 14, color: isQuote ? Colors.grey[700] : Colors.grey[800]),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
