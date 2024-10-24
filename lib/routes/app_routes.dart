import 'package:get/get.dart';
import 'package:pkl_flutter/views/home_page.dart';
import 'package:pkl_flutter/views/location_list_page.dart';
import 'package:pkl_flutter/views/equipment_list_page.dart';

class AppRoutes {
  static const home = '/';
  static const locationList = '/locations';
  static const equipmentList = '/equipments';

  static final routes = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: locationList, page: () => const LocationListPage()),
    GetPage(name: equipmentList, page: () => const EquipmentListPage()),
  ];
}
