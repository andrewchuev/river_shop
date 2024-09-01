class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;
  int quantity; // добавлено поле для количества

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    this.quantity = 0, // по умолчанию 0
  });

  Product copyWith({
    int? id,
    String? title,
    String? description,
    String? image,
    double? price,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
