import 'package:get/get.dart';
import '../views/home/home_page.dart';
import '../views/location/location_list_page.dart';
import '../views/location/location_detail_page.dart';
import '../views/equipment/equipment_list_page.dart';
import '../views/equipment/equipment_rent_page.dart';

// Import bindings
import '../bindings/location_binding.dart';
import '../bindings/equipment_binding.dart';

class AppRoutes {
  static const home = '/';
  static const locationList = '/locations';
  static const locationDetail = '/location_detail';
  static const equipmentList = '/equipment';
  static const equipmentRent = '/rent_equipment';

  static final routes = [
    GetPage(name: home, page: () => HomePage()),

    // Menggunakan binding untuk Location
    GetPage(
      name: locationList,
      page: () => LocationListPage(),
      binding: LocationBinding(), // Bind LocationController
    ),
    GetPage(
      name: locationDetail,
      page: () => LocationDetailPage(),
      binding: LocationBinding(), // Bind LocationController, bisa gunakan argumen Get
    ),

    // Menggunakan binding untuk Equipment
    GetPage(
      name: equipmentList,
      page: () => EquipmentListPage(),
      binding: EquipmentBinding(), // Bind EquipmentController
    ),
    GetPage(
      name: equipmentRent,
      page: () => EquipmentRentPage(),
      binding: EquipmentBinding(), // Bind EquipmentController
    ),
  ];
}