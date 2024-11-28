class ProductModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final String image;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      image: json['images']?.isNotEmpty == true ? json['images'][0] : '',
    );
  }
}
