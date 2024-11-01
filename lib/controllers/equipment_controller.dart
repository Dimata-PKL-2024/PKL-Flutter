import 'package:get/get.dart';
import '../models/equipment_model.dart';

class EquipmentController extends GetxController {
  final equipmentList = <Equipment>[].obs;
  final cartItems = <Equipment>[].obs; 
  final cartItemCount = 0.obs; 

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

  // Fungsi untuk menambahkan item ke keranjang
  void addToCart(Equipment equipment) {
    cartItems.add(equipment);
    cartItemCount.value = cartItems.length; // Update jumlah item di keranjang
    Get.snackbar('Berhasil', '${equipment.name} ditambahkan ke keranjang');
  }
}
