class Sushi {
  const Sushi({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  factory Sushi.fromJson(Map<String, dynamic> json) {

    return Sushi(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        price: json['price'] ?? '',
        imageUrl: json['img_url'] ?? '',
    );
  }
}
