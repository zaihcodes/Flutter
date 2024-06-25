import 'dart:ui';

import '../model/product_model.dart';

class ProductData {
  static List<ProductModel> data = [
    ProductModel(
        id: 1,
        title: "Office Code",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/bag_1.png",
        color: Color(0xFF3D82AE)),
    ProductModel(
        id: 2,
        title: "Belt Bag",
        price: 234,
        size: 8,
        description: dummyText,
        image: "assets/images/bag_2.png",
        color: Color(0xFFD3A984)),
    ProductModel(
        id: 3,
        title: "Hang Top",
        price: 234,
        size: 10,
        description: dummyText,
        image: "assets/images/bag_3.png",
        color: Color(0xFF989493)),
    ProductModel(
        id: 4,
        title: "Old Fashion",
        price: 234,
        size: 11,
        description: dummyText,
        image: "assets/images/bag_4.png",
        color: Color(0xFFE6B398)),
    ProductModel(
        id: 5,
        title: "Office Code",
        price: 234,
        size: 12,
        description: dummyText,
        image: "assets/images/bag_5.png",
        color: Color(0xFFFB7883)),
    ProductModel(
      id: 6,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/images/bag_6.png",
      color: Color(0xFFAEAEAE),
    ),
  ];

  static String dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
}
