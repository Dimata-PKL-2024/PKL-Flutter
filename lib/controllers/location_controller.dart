import 'package:get/get.dart';
import '../models/location_model.dart';

class LocationController extends GetxController {
  // Reactive list of camping locations using data from the model
  final locations = <Location>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the locations list from the model when the controller is initialized
    locations.addAll(Location.getLocations());
  }

  // Fetch location details (optional if needed)
  Location getLocationDetails(int index) {
    return locations[index];
  }
}
