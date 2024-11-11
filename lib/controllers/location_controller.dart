import 'package:get/get.dart';
import '../models/location_model.dart';

class LocationController extends GetxController {
  final locations = <Location>[].obs;

  @override
  void onInit() {
    super.onInit();
    locations.addAll(Location.getLocations());
  }

  // Mendapatkan detail lokasi berdasarkan index
  Location getLocationDetails(int index) {
    return locations[index];
  }

  // Mengubah status wishlist lokasi
  void toggleWishlist(Location location) {
    location.isWishlisted = !location.isWishlisted;
    // Simpan status wishlist ke storage atau provider sesuai kebutuhan
    update(); // Memperbarui tampilan setelah perubahan status wishlist
  }
}
