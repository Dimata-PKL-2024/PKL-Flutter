import 'package:get/get.dart';
import '../models/equipment_model.dart';

class EquipmentController extends GetxController {
  final equipmentList = <Equipment>[].obs;
  final cartItems = <Equipment>[].obs;
  final cartItemCount = 0.obs;
  final quantity = 1.obs;

  @override
  void onInit() {
    super.onInit();
    equipmentList.addAll(Equipment.getEquipmentList());
  }

  // Mendapatkan detail barang berdasarkan indeks
  Equipment getEquipmentDetails(int index) {
    return equipmentList[index];
  }

  // Logika penyewaan barang dengan notifikasi
  void rentEquipment(Equipment equipment) {
    Get.snackbar('Berhasil', 'Anda telah menyewa ${equipment.name}');
  }

  // Logika penambahan item ke keranjang
  void addToCart(Equipment equipment) {
    int existingIndex = cartItems.indexWhere((item) => item.name == equipment.name);

    if (existingIndex != -1) {
      cartItems[existingIndex].quantity += quantity.value;
    } else {
      Equipment itemToAdd = Equipment(
        name: equipment.name,
        description: equipment.description,
        pricePerDay: equipment.pricePerDay,
        imagePath: equipment.imagePath,
        specifications: equipment.specifications,
        quantity: quantity.value,
      );
      cartItems.add(itemToAdd);
    }

    cartItemCount.value = cartItems.length;

    Get.snackbar('Berhasil', '${equipment.name} (${quantity.value}) ditambahkan ke keranjang');
  }

  // Pengaturan jumlah untuk barang yang ingin disewa
  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void setQuantity(int newQuantity) {
    if (newQuantity >= 1) {
      quantity.value = newQuantity;
    }
  }

  void removeFromCart(Equipment equipment) {
    cartItems.remove(equipment);
    cartItemCount.value = cartItems.length;
  }

}
