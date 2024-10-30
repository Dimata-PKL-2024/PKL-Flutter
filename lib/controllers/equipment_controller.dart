import 'package:get/get.dart';
import '../models/equipment_model.dart';

class EquipmentController extends GetxController {
  final equipmentList = <Equipment>[].obs;

  @override
  void onInit() {
    super.onInit();
    equipmentList.addAll(Equipment.getEquipmentList());
  }

  Equipment getEquipmentDetails(int index) {
    return equipmentList[index];
  }

  void rentEquipment(Equipment equipment) {
    Get.snackbar('Berhasil', 'Anda telah menyewa ${equipment.name}');
  }
}
