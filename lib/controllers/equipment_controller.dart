import 'package:get/get.dart';
import '../models/equipment_model.dart';

class EquipmentController extends GetxController {
  // List of available camping equipment
  final equipmentList = <Equipment>[
    Equipment(
      name: 'Tenda',
      description: 'Tenda nyaman untuk dua orang.',
      pricePerDay: 100000,
      imageUrl: 'https://example.com/tent.jpg',
    ),
    Equipment(
      name: 'Sleeping Bag',
      description: 'Sleeping bag hangat dan nyaman.',
      pricePerDay: 50000,
      imageUrl: 'https://example.com/sleepingbag.jpg',
    ),
  ].obs;

  // Fetch equipment details (this could later connect to a service or database)
  Equipment getEquipmentDetails(int index) {
    return equipmentList[index];
  }

  // Logic to rent equipment
  void rentEquipment(Equipment equipment) {
    Get.snackbar('Berhasil', 'Anda telah menyewa ${equipment.name}');
  }
}