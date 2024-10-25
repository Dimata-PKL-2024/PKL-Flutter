import 'package:get/get.dart';
import '../models/equipment_model.dart';

class EquipmentController extends GetxController {
  // Reactive list of available camping equipment
  final equipmentList = <Equipment>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the equipment list from the model
    equipmentList.addAll(Equipment.getEquipmentList());
  }

  // Fetch equipment details by index
  Equipment getEquipmentDetails(int index) {
    return equipmentList[index];
  }

  // Logic to rent equipment
  void rentEquipment(Equipment equipment) {
    Get.snackbar('Berhasil', 'Anda telah menyewa ${equipment.name}');
  }
}
