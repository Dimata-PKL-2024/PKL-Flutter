import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/location_controller.dart';

class LocationListPage extends StatelessWidget {
  final LocationController controller = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
        backgroundColor: Colors.teal[700],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        // Mengambil data lokasi dari controller
        final locations = controller.locations;

        return ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            final location = locations[index];
            return ListTile(
              leading: Image.asset(location.imagePath, width: 50, height: 50, fit: BoxFit.cover),
              title: Text(location.name),
              subtitle: Text(location.description),
              onTap: () {
                Get.toNamed('/location-detail', arguments: location);
              },
            );
          },
        );
      }),
    );
  }
}
