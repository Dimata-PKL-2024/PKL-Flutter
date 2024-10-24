// lib/routes/app_routes.dart
import 'package:get/get.dart';
import '../views/home/home_page.dart';
import '../views/location/location_list_page.dart';
import '../views/location/location_detail_page.dart';
import '../views/equipment/equipment_list_page.dart';
import '../views/equipment/equipment_rent_page.dart';

class AppRoutes {
  static const home = '/';
  static const locationList = '/locations';
  static const locationDetail = '/location_detail';
  static const equipmentList = '/equipment';
  static const equipmentRent = '/rent_equipment';

  static final routes = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: locationList, page: () => LocationListPage()),
    GetPage(name: locationDetail, page: () => LocationDetailPage()),
    GetPage(name: equipmentList, page: () => EquipmentListPage()),
    GetPage(name: equipmentRent, page: () => EquipmentRentPage()),
  ];
}
