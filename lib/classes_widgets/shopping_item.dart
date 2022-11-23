class ShoppingItem {
  String title;
  String url;
  int price;
  int left = 0;
  String specs;
  bool isInCart = false;
  int counter = 0;

  ShoppingItem({
    required this.title,
    required this.url,
    required this.price,
    required this.left,
    required this.specs,
    required this.isInCart,
    required this.counter,
  });
}
