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

  void addToCart(Equipment equipment, int quantity) {
    int existingIndex =
        cartItems.indexWhere((item) => item.name == equipment.name);

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity += quantity;
    } else {
      Equipment itemToAdd = Equipment(
        name: equipment.name,
        description: equipment.description,
        pricePerDay: equipment.pricePerDay,
        imagePath: equipment.imagePath,
        specifications: equipment.specifications,
        quantity: quantity,
      );
      cartItems.add(itemToAdd);
    }

    cartItemCount.value = cartItems.length;

    Get.snackbar(
        'Berhasil', '${equipment.name} ($quantity) ditambahkan ke keranjang');
  }
}
