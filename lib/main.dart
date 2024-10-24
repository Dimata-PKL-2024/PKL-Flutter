import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkl_flutter/routes/app_routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Camping App',
      initialRoute: AppRoutes.home,
      getPages: AppRoutes.routes,
    );
  }
}
