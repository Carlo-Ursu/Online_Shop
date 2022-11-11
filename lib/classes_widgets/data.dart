import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';
import 'package:shopping_cart_1/classes_widgets/user.dart';

List<ShoppingItem> shoppingList = [
  ShoppingItem(
      title: 'IMac', url: 'assets/imac.jpeg', price: '1000\$', left: 15),
  ShoppingItem(
    title: 'MacBook Air',
    url: 'assets/macbookair.jpeg',
    price: '1100\$',
    left: 12,
  ),
  ShoppingItem(
      title: 'MacBook Pro',
      url: 'assets/macbookpro.jpeg',
      price: '1200\$',
      left: 25),
];

List<User> userData = [
  User(username: 'ana', password: 'maria'),
  User(username: 'carlo', password: 'ursu'),
  User(username: 'clara', password: 'maria'),
  User(username: 'parola', password: '123'),
  User(username: 'alexia', password: 'abc'),
];