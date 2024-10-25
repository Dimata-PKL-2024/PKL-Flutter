class Equipment {
  final String name;
  final String description;
  final double pricePerDay;
  final String imagePath;
  final Map<String, String> specifications;

  Equipment({
    required this.name,
    required this.description,
    required this.pricePerDay,
    required this.imagePath,
    required this.specifications, // New field for specifications
  });

  // Static method to fetch list of equipment
  static List<Equipment> getEquipmentList() {
    return [
      Equipment(
        name: 'Tenda',
        description: 'Tenda nyaman untuk dua orang, tahan angin dan hujan.',
        pricePerDay: 100000,
        imagePath: 'images/tenda.png',
        specifications: {
          'Bahan': 'Poliester Tahan Air',
          'Kapasitas': '2 Orang',
          'Berat': '1.5 kg',
        },
      ),
      Equipment(
        name: 'Sleeping Bag',
        description: 'Sleeping bag hangat, cocok untuk segala cuaca.',
        pricePerDay: 50000,
        imagePath: 'images/sb.png',
        specifications: {
          'Bahan': 'Nilon',
          'Kapasitas': '1 Orang',
          'Berat': '1 kg',
        },
      ),
      Equipment(
        name: 'Kompor',
        description: 'Kompor portabel yang mudah dibawa, cocok untuk memasak di alam.',
        pricePerDay: 50000,
        imagePath: 'images/kompor.png',
        specifications: {
          'Bahan': 'Alumunium',
          'Kapasitas': '2 Panci',
          'Berat': '0.8 kg',
        },
      ),
      Equipment(
        name: 'Matras',
        description: 'Matras nyaman untuk tidur di alam bebas.',
        pricePerDay: 50000,
        imagePath: 'images/matras.png',
        specifications: {
          'Bahan': 'Busa',
          'Kapasitas': '1 Orang',
          'Berat': '0.5 kg',
        },
      ),
      Equipment(
        name: 'Headlamp',
        description: 'Headlamp dengan cahaya terang, ideal untuk aktivitas malam.',
        pricePerDay: 50000,
        imagePath: 'images/headlamp.png',
        specifications: {
          'Bahan': 'Plastik',
          'Kapasitas': '1 Orang',
          'Berat': '0.3 kg',
        },
      ),
    ];
  }
}