class Product {
  final int id;
  final String name;
  final String description;
  final double pricePerKg;
  final double stockKg;
  final String? image;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.pricePerKg,
    required this.stockKg,
    this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      pricePerKg: double.parse(json['price_per_kg']),
      stockKg: double.parse(json['stock_kg'].toString()),
      image: json['image'],
    );
  }
}
