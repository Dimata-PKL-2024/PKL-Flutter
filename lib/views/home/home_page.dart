import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  final String imagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Latar belakang gambar
      body: Stack(
        children: [
          // Gambar latar belakang
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath), // Menggunakan AssetImage
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Konten di atas gambar
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Teks judul aplikasi
                  Text(
                    'Selamat Datang di Camping App',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  // Tombol untuk menjelajahi lokasi camping
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent[400], // Warna tombol
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Get.toNamed(AppRoutes.locationList),
                    child: Text('Jelajahi Lokasi Camping'),
                  ),
                  SizedBox(height: 20),
                  // Tombol untuk menyewa peralatan camping
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent, // Warna tombol kedua
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Get.toNamed(AppRoutes.equipmentList),
                    child: Text('Sewa Peralatan Camping'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
