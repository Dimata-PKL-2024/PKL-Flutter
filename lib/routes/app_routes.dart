import 'package:get/get.dart';
import '../views/home/home_page.dart';
import '../views/location/location_list_page.dart';
import '../views/location/location_detail_page.dart';
import '../views/equipment/equipment_list_page.dart';
import '../views/equipment/equipment_rent_page.dart';
import '../views/auth/login_page.dart';
import '../views/auth/register_page.dart';

import '../bindings/location_binding.dart';
import '../bindings/equipment_binding.dart';
import '../bindings/auth_binding.dart';

class AppRoutes {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';
  static const locationList = '/locations';
  static const locationDetail = '/location_detail';
  static const equipmentList = '/equipment';
  static const equipmentRent = '/rent_equipment';

  static final routes = [
    GetPage(name: home, page: () => HomePage()),

    // GetPage(
    //   name: login,
    //   page: () => LoginPage(),
    //   binding: AuthBinding()
    // ),
    // GetPage(
    //   name: register,
    //   page: () => RegisterPage(),
    //   binding: AuthBinding()
    // ),

    GetPage(name: login, page: () => LoginPage(), binding: AuthBinding()),
    GetPage(name: register, page: () => RegisterPage(), binding: AuthBinding()),

    GetPage(
      name: locationList,
      page: () => LocationListPage(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: locationDetail,
      page: () => LocationDetailPage(),
      binding: LocationBinding(),
    ),

    GetPage(
      name: equipmentList,
      page: () => EquipmentListPage(),
      binding: EquipmentBinding(),
    ),
    GetPage(
      name: equipmentRent,
      page: () => EquipmentRentPage(),
      binding: EquipmentBinding(),
    ),
  ];
}
