import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkl_flutter/controllers/equipment_controller.dart';

class CartPage extends StatelessWidget {
  final EquipmentController controller = Get.find(); // Mengambil instance EquipmentController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        if (controller.cartItems.isEmpty) {
          return Center(
            child: Text(
              'Keranjang kosong',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          );
        } else {
          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: controller.cartItems.length,
            itemBuilder: (context, index) {
              final equipment = controller.cartItems[index];
              return buildCartItemCard(equipment);
            },
          );
        }
      }),
    );
  }

  Widget buildCartItemCard(equipment) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: buildImage(equipment.imagePath),
        title: buildTitle(equipment.name),
        subtitle: buildSubtitle(equipment.pricePerDay),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle, color: Colors.red),
          onPressed: () {
            // Logika untuk menghapus item dari keranjang
            controller.cartItems.remove(equipment);
            controller.cartItemCount.value = controller.cartItems.length; // Update jumlah item di keranjang
          },
        ),
      ),
    );
  }

  Widget buildImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imagePath,
        width: 80,
        height: 80,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildTitle(String name) {
    return Text(
      name,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.blueAccent[700],
      ),
    );
  }

  Widget buildSubtitle(double pricePerDay) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        'Rp${pricePerDay}/hari',
        style: TextStyle(color: Colors.green[600], fontSize: 16),
      ),
    );
  }
}
