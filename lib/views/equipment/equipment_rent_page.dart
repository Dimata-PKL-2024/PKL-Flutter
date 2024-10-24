import 'package:flutter/material.dart';
import '../../../models/equipment_model.dart';
import 'package:get/get.dart';

class EquipmentRentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Equipment equipment = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sewa ${equipment.name}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              equipment.imageUrl,
              width: double.infinity,
              height: 250.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                equipment.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                equipment.description,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Harga per hari: Rp${equipment.pricePerDay}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic untuk menyewa peralatan
                  Get.snackbar('Berhasil', 'Anda telah menyewa ${equipment.name}');
                },
                child: Text('Sewa Sekarang'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
