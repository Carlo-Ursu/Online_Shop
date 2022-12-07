import 'package:shopping_cart_1/pages/shop.dart';

class ShoppingItem {
  String title;
  List url;
  int price;
  int stock = 0;
  String specs;
  bool isInCart = false;
  int counter = 0;
  String thumbnail;

  ShoppingItem({
    required this.title,
    required this.url,
    required this.price,
    required this.stock,
    required this.specs,
    required this.isInCart,
    required this.counter,
    required this.thumbnail,
  });

  factory ShoppingItem.fromJson(dynamic json) {
    return ShoppingItem(
      title: json['title'] as String,
      url: json['images'] as List,
      specs: json['description'] as String,
      stock: json['stock'] as int,
      price: json['price'] as int,
      isInCart: false,
      counter: 0,
      thumbnail: json['thumbnail'] as String,
    );
  }

  static List<ShoppingItem> itemsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return ShoppingItem.fromJson(data);
    }).toList();
  }
}
