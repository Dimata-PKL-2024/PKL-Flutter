class Location {
  final String name;
  final String description;
  final String imagePath;
  final List<String> facilities;
  final String price;
  final double rating;
  final List<String> activities;
  final List<String> rules;
  final String bestSeason;
  final String weather;
  final String shortLocation; 

  Location({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.facilities,
    required this.price,
    required this.rating, 
    required this.activities,
    required this.rules,
    required this.bestSeason,
    required this.weather,
    required this.shortLocation, 
  });

 
  static List<Location> getLocations() {
    return [
      Location(
        name: 'Bukit Asah',
        description: 'Terletak di tepi tebing yang menghadap langsung ke laut, Bukit Asah menawarkan pemandangan matahari terbit yang menakjubkan serta suasana tenang dan damai.',
        imagePath: 'images/asah.jpg', // Add the image path here
        facilities: ['Tempat parkir', 'Toilet umum', 'Akses air bersih', 'Spot api unggun'],
        price: 'Rp150.000 per malam untuk tenda',
        rating: 4.8, // Ganti dengan rating
        activities: ['Berkemah', 'Trekking di sekitar bukit', 'Menikmati pemandangan sunrise'],
        rules: ['Tidak boleh membuat api unggun di area tertentu', 'Maksimum 4 orang per tenda'],
        bestSeason: 'Musim kemarau (April hingga Oktober)',
        weather: 'Cerah, suhu 23°C pada siang hari',
        shortLocation: 'Karangasem, Bali', // Lokasi singkat
      ),
      Location(
        name: 'Bukit Trunyan',
        description: 'Bukit yang terletak di sekitar Danau Batur ini dikenal dengan pemandangannya yang mempesona.',
        imagePath: 'images/trunyan.webp',
        facilities: ['Toilet umum', 'Area parkir', 'Tempat piknik'],
        price: 'Rp120.000 per malam',
        rating: 4.5, // Ganti dengan rating
        activities: ['Berkemah', 'Kunjungan ke Desa Trunyan', 'Berperahu di Danau Batur'],
        rules: ['Jangan tinggalkan sampah', 'Api unggun di area yang ditentukan'],
        bestSeason: 'April hingga September',
        weather: 'Berawan, suhu 18°C',
        shortLocation: 'Kintamani, Bali', // Lokasi singkat
      ),
      Location(
        name: 'Danau Buyan',
        description: 'Berada di dataran tinggi Bedugul, lokasi ini cocok untuk berkemah sambil menikmati keindahan alam dan kesejukan udara pegunungan.',
        imagePath: 'images/buyan.jpg',
        facilities: ['Area perkemahan luas', 'Toilet umum dan pancuran', 'Tempat parkir'],
        price: 'Rp175.000 per malam',
        rating: 4.7, // Ganti dengan rating
        activities: ['Berkemah', 'Berjalan di sekitar danau', 'Kegiatan air seperti berperahu'],
        rules: ['Tidak diperbolehkan memancing di area tertentu', 'Maksimal 3 tenda per kelompok'],
        bestSeason: 'Musim kemarau (Mei hingga Oktober)',
        weather: 'Sejuk, suhu 20°C',
        shortLocation: 'Buleleng, Bali', // Lokasi singkat
      ),
      Location(
        name: 'Pinggan',
        description: 'Kampung Pinggan menawarkan pengalaman camping dengan pemandangan sunrise yang dramatis.',
        imagePath: 'images/pinggan.jpg',
        facilities: ['Area parkir luas', 'Toilet umum'],
        price: 'Rp100.000 per malam',
        rating: 4.6, // Ganti dengan rating
        activities: ['Berkemah', 'Trekking pagi hari'],
        rules: ['Api unggun hanya di tempat yang disediakan', 'Batas maksimum 5 tenda'],
        bestSeason: 'Juni hingga Agustus',
        weather: 'Cerah, suhu 15°C',
        shortLocation: 'Kintamani, Bali', // Lokasi singkat
      ),
      Location(
        name: 'Bukit Cinta',
        description: 'Terkenal sebagai spot terbaik untuk melihat Gunung Agung, Bukit Cinta memiliki lanskap yang luas dan romantis.',
        imagePath: 'images/buyan.jpg',
        facilities: ['Area camping yang luas', 'Toilet umum', 'Tempat piknik'],
        price: 'Rp130.000 per malam',
        rating: 4.8, // Ganti dengan rating
        activities: ['Berkemah', 'Fotografi lanskap', 'Piknik bersama keluarga'],
        rules: ['Tidak boleh membawa kendaraan masuk ke area camping'],
        bestSeason: 'Musim kemarau',
        weather: 'Cerah, suhu 25°C',
        shortLocation: 'Karangasem, Bali', // Lokasi singkat
      ),
      Location(
        name: 'Bukit Surga',
        description: 'Bukit Surga menawarkan pemandangan yang spektakuler dengan panorama alam yang menyejukkan.',
        imagePath: 'images/surga.jpg',
        facilities: ['Toilet umum', 'Spot foto'],
        price: 'Rp140.000 per malam',
        rating: 4.9, // Ganti dengan rating
        activities: ['Berkemah', 'Menikmati sunset dan sunrise'],
        rules: ['Hanya diperbolehkan untuk 10 tenda per hari'],
        bestSeason: 'Musim kemarau',
        weather: 'Cerah, suhu 24°C',
        shortLocation: 'Bali', // Lokasi singkat
      ),
      // Tambahkan data untuk lokasi lainnya sesuai kebutuhan
    ];
  }
}
