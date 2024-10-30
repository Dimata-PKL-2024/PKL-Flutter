import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkl_flutter/controllers/equipment_controller.dart';
import '../../../routes/app_routes.dart';

class EquipmentListPage extends StatelessWidget {
  final EquipmentController controller = Get.put(EquipmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Obx(() {
        return buildEquipmentList();
      }),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Peralatan Camping',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      backgroundColor: Colors.blueAccent,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  Widget buildEquipmentList() {
    return ListView.builder(
      padding: EdgeInsets.all(8),
      itemCount: controller.equipmentList.length,
      itemBuilder: (context, index) {
        final equipment = controller.equipmentList[index];
        return buildEquipmentCard(equipment);
      },
    );
  }

  Widget buildEquipmentCard(equipment) {
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
        trailing: Icon(Icons.arrow_forward_ios,
            color: Colors.blueAccent[700], size: 18),
        onTap: () {
          Get.toNamed(AppRoutes.equipmentRent, arguments: equipment);
        },
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
