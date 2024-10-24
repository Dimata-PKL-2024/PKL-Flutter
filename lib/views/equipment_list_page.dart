import 'package:flutter/material.dart';

class EquipmentListPage extends StatelessWidget {
  const EquipmentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Alat Camping'),
      ),
      body: ListView.builder(
        itemCount: 10, // Dummy data
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Alat Camping $index'),
            subtitle: Text('Deskripsi alat camping $index'),
            trailing: const Icon(Icons.add_shopping_cart),
            onTap: () {
              // Implementasi penyewaan alat nanti
            },
          );
        },
      ),
    );
  }
}
