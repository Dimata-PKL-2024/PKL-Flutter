import 'package:flutter/material.dart';
import '../../../models/equipment_model.dart';
import 'package:get/get.dart';

class EquipmentRentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Equipment equipment = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sewa ${equipment.name}',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImageSection(equipment.imagePath),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitleSection(equipment),
                  Divider(color: Colors.blueAccent[100], thickness: 1.5),
                  buildSpecificationSection(equipment),
                  Divider(color: Colors.blueAccent[100], thickness: 1.5),
                  buildUserReviewsSection(),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar(
                      'Berhasil', 'Anda telah menyewa ${equipment.name}');
                },
                child: Text(
                  'Sewa Sekarang',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                  textStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget buildImageSection(String imagePath) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Popular',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTitleSection(Equipment equipment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          equipment.name,
          style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent[700]),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star, color: Colors.amber, size: 20),
            Icon(Icons.star_half, color: Colors.amber, size: 20),
            SizedBox(width: 8),
            Text('4.5 (200 reviews)',
                style: TextStyle(color: Colors.grey[700])),
          ],
        ),
        SizedBox(height: 8),
        Text(
          equipment.description,
          style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
        ),
        SizedBox(height: 16),
        Text(
          'Harga per hari: Rp${equipment.pricePerDay}',
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent[700]),
        ),
      ],
    );
  }

  Widget buildSpecificationSection(Equipment equipment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Spesifikasi',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.blueAccent[700]),
        ),
        SizedBox(height: 8),
        buildSpecRow(
            'Bahan', equipment.specifications['Bahan'] ?? 'Tidak diketahui'),
        buildSpecRow('Kapasitas',
            equipment.specifications['Kapasitas'] ?? 'Tidak diketahui'),
        buildSpecRow(
            'Berat', equipment.specifications['Berat'] ?? 'Tidak diketahui'),
      ],
    );
  }

  Widget buildSpecRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, color: Colors.grey[800])),
          Text(value,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800])),
        ],
      ),
    );
  }

  Widget buildUserReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ulasan Pengguna',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.blueAccent[700]),
        ),
        SizedBox(height: 8),
        buildReviewCard('Budi', 'Sangat nyaman, cocok untuk camping!', 4.5),
        buildReviewCard('Sari', 'Cocok untuk dua orang, kualitas bagus.', 4.0),
        buildReviewCard(
            'Adi', 'Ringan dan mudah dibawa, direkomendasikan!', 5.0),
      ],
    );
  }

  Widget buildReviewCard(String user, String review, double rating) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(Icons.person, color: Colors.blueAccent, size: 30),
        title: Text(user, style: TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 18,
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(review, style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}
