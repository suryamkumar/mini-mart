class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final double originalPrice; // NEW
  final String quantity; // e.g., "Pack of 12"
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.imageUrl,
  });
}
