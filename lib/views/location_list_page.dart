import 'package:flutter/material.dart';

class LocationListPage extends StatelessWidget {
  const LocationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Lokasi Camping'),
      ),
      body: ListView.builder(
        itemCount: 10, // Dummy data
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Lokasi Camping $index'),
            subtitle: Text('Deskripsi singkat tentang lokasi camping $index'),
            onTap: () {
              // Implementasi detail page nanti
            },
          );
        },
      ),
    );
  }
}
