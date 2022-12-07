import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';
import 'package:shopping_cart_1/classes_widgets/user.dart';

List<ShoppingItem> shoppingList = [
  ShoppingItem(
    title: 'IMac',
    url: 'assets/imac.jpeg',
    price: 1299,
    left: 15,
    specs: '8GB unified memory \n24-inch 4.5K Retina display \nApple M2 chip',
    isInCart: false,
    counter: 0,
  ),
  ShoppingItem(
    title: 'MacBook Air',
    url: 'assets/macbookair.jpeg',
    price: 999,
    left: 12,
    specs: '8GB unified memory \n13.3-inch LED-backlit display \nApple M1 chip',
    isInCart: false,
    counter: 0,
  ),
  ShoppingItem(
    title: 'MacBook Pro',
    url: 'assets/macbookpro.jpeg',
    price: 1299,
    left: 25,
    specs: '8GB unified memory \n13.3-inch LED-backlit display \nApple M2 chip',
    isInCart: false,
    counter: 0,
  ),
  ShoppingItem(
    title: 'Airpods Pro Series 3',
    url: 'assets/airpodspro3.jpeg',
    price: 199,
    left: 7,
    specs: 'Adaptive EQ \nIPX4 water and sweat resistance \nH1 headphone chip',
    isInCart: false,
    counter: 0,
  ),
  ShoppingItem(
    title: 'Apple Watch Ultra',
    url: 'assets/applewatchultra.jpeg',
    price: 1199,
    left: 14,
    specs: 'Sapphire crystal glass \nRetina LTPO OLED display \nGPS (L1+L5)',
    isInCart: false,
    counter: 0,
  ),
];

List<User> userData = [
  User(username: 'ana', password: 'maria'),
  User(username: 'carlo', password: 'ursu'),
  User(username: 'clara', password: 'maria'),
  User(username: 'parola', password: '123'),
  User(username: 'alexia', password: 'abc'),
];
