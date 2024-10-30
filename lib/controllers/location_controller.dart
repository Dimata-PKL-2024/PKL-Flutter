import 'package:get/get.dart';
import '../models/location_model.dart';

class LocationController extends GetxController {
  final locations = <Location>[].obs;

  @override
  void onInit() {
    super.onInit();
    locations.addAll(Location.getLocations());
  }

  Location getLocationDetails(int index) {
    return locations[index];
  }
}
