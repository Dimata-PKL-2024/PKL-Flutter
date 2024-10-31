import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/location_model.dart';
import '../../../routes/app_routes.dart';

class LocationItem extends StatelessWidget {
  final Location location;
  final VoidCallback onWishlistToggle;
  final VoidCallback? onDelete;
  final bool isWishlisted;

  const LocationItem({
    Key? key,
    required this.location,
    required this.onWishlistToggle,
    this.onDelete,
    required this.isWishlisted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.locationDetail, arguments: location);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  location.imagePath,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700],
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.teal[300],
                          size: 18,
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            location.shortLocation,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.teal[600],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isWishlisted
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isWishlisted ? Colors.red : Colors.grey,
                          ),
                          onPressed: onWishlistToggle,
                        ),
                        if (onDelete != null)
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            onPressed: onDelete,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationListPage extends StatefulWidget {
  @override
  _LocationListPageState createState() => _LocationListPageState();
}

class _LocationListPageState extends State<LocationListPage> {
  List<Location> locations = Location.getLocations();
  List<Location> filteredLocations = Location.getLocations();
  List<Location> wishlist = [];

  void _filterLocations(String query) {
    setState(() {
      filteredLocations = locations
          .where((location) =>
              location.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _toggleWishlist(Location location) {
    setState(() {
      if (wishlist.contains(location)) {
        wishlist.remove(location);
      } else {
        wishlist.add(location);
      }
    });
  }

  void _removeFromWishlist(Location location) {
    setState(() {
      wishlist.remove(location);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lokasi Camping', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal[400],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    onChanged: _filterLocations,
                    decoration: InputDecoration(
                      hintText: 'Cari lokasi...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () async {
                      final result = await Get.to(WishlistPage(
                        wishlist: wishlist,
                        onRemoveFromWishlist: _removeFromWishlist,
                      ));
                      if (result != null && result) {
                        setState(() {});
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite, color: Colors.red),
                        SizedBox(width: 6),
                        Text(
                          'Wishlist',
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredLocations.length,
              itemBuilder: (context, index) {
                final location = filteredLocations[index];
                return LocationItem(
                  location: location,
                  onWishlistToggle: () => _toggleWishlist(location),
                  isWishlisted: wishlist.contains(location),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class WishlistPage extends StatefulWidget {
  final List<Location> wishlist;
  final Function(Location) onRemoveFromWishlist;

  const WishlistPage({
    Key? key,
    required this.wishlist,
    required this.onRemoveFromWishlist,
  }) : super(key: key);

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal[400],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: widget.wishlist.isEmpty
          ? Center(child: Text('Belum ada lokasi dalam wishlist'))
          : ListView.builder(
              itemCount: widget.wishlist.length,
              itemBuilder: (context, index) {
                final location = widget.wishlist[index];
                return LocationItem(
                  location: location,
                  onWishlistToggle: () {}, // Tidak digunakan di halaman ini
                  onDelete: () {
                    setState(() {
                      widget.wishlist.remove(location);
                    });
                    widget.onRemoveFromWishlist(location);
                  },
                  isWishlisted: true,
                );
              },
            ),
    );
  }
}
