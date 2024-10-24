import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkl_flutter/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camping App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.locationList);
              },
              child: const Text('Cari Lokasi Camping'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.equipmentList);
              },
              child: const Text('Sewa Alat Camping'),
            ),
          ],
        ),
      ),
    );
  }
}
