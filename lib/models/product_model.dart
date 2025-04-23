class Product {
  final int id;
  final String title;
  final String description;
  final num price;
  final num rating;
  final String thumbnail;
  final List<String> images;
  final String category;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.thumbnail,
    required this.images,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      rating: json['rating'],
      thumbnail: json['thumbnail'],
      images: List<String>.from(json['images'] ?? []),
      category: json['category'],
    );
  }
}