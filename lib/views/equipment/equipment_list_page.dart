import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/equipment_model.dart';
import '../../../routes/app_routes.dart';

class EquipmentListPage extends StatelessWidget {
  final List<Equipment> equipmentList = [
    Equipment(
      name: 'Tenda',
      description: 'Tenda camping nyaman untuk dua orang.',
      pricePerDay: 10.0,
      imageUrl: 'https://example.com/tent.jpg',
    ),
    Equipment(
      name: 'Sleeping Bag',
      description: 'Sleeping bag yang hangat dan nyaman.',
      pricePerDay: 5.0,
      imageUrl: 'https://example.com/sleepingbag.jpg', 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Peralatan Camping'),
      ),
      body: ListView.builder(
        itemCount: equipmentList.length,
        itemBuilder: (context, index) {
          final equipment = equipmentList[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.network(
                equipment.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                equipment.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Rp${equipment.pricePerDay}/hari',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Get.toNamed(AppRoutes.equipmentRent, arguments: equipment);
              },
            ),
          );
        },
      ),
    );
  }
}
