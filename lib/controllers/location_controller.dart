import 'package:get/get.dart';
import '../models/location_model.dart';

class LocationController extends GetxController {
  // List of camping locations
  final locations = <Location>[
    Location(
      name: 'Gunung Bromo',
      description: 'Tempat camping favorit di pegunungan.',
      imageUrl: 'https://example.com/bromo.jpg',
    ),
    Location(
      name: 'Ranu Kumbolo',
      description: 'Danau yang indah untuk tempat camping.',
      imageUrl: 'https://example.com/ranu.jpg',
    ),
  ].obs;

  // Fetch location details (this could later connect to a service or database)
  Location getLocationDetails(int index) {
    return locations[index];
  }
}