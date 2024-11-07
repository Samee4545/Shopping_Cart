// product.dart
class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  @override
  String toString() {
    return 'Product(name: $name, price: $price, imageUrl: $imageUrl, description: $description)';
  }
}
