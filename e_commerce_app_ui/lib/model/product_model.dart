import 'dart:ui';

class ProductModel {
  final String image, title, description;
  final int price, size, id;
  final Color color;

  ProductModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.size,
      required this.id,
      required this.color});
}
