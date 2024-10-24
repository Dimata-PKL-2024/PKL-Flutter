import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/location_model.dart';
import '../../../routes/app_routes.dart';

class LocationListPage extends StatelessWidget {
  final List<Location> locations = [
    Location(
      name: 'Gunung Bromo',
      description: 'Salah satu spot camping gunung yang populer.',
      imageUrl: 'https://example.com/bromo.jpg', // Ganti dengan URL gambar yang sesuai
    ),
    Location(
      name: 'Ranu Kumbolo',
      description: 'Danau yang indah untuk berkemah.',
      imageUrl: 'https://example.com/ranu.jpg', // Ganti dengan URL gambar yang sesuai
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lokasi Camping'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                location.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                location.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(location.description),
              onTap: () {
                Get.toNamed(AppRoutes.locationDetail, arguments: location);
              },
            ),
          );
        },
      ),
    );
  }
}
