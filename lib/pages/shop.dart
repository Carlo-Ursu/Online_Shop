import 'package:flutter/material.dart';
import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';
import 'package:shopping_cart_1/classes_widgets/item_card.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List<ShoppingItem> shoppingList = [
    ShoppingItem(url: 'assets/imac.jpeg', price: '1000\$', counter: 0),
    ShoppingItem(url: 'assets/macbookair.jpeg', price: '1100\$', counter: 0),
    ShoppingItem(url: 'assets/macbookpro.jpeg', price: '1200\$', counter: 0),
  ];

  Widget itemTemplate(item) {
    return ItemCard(item: item);
  }

  dynamic data = {};

  @override
  Widget build(BuildContext context) {
    dynamic data =
        ModalRoute.of(context)?.settings.arguments ?? {'username': "undefined"};
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to our shop, ${data['username']}'),
        backgroundColor: Colors.amber[800],
        actions: [
          ButtonBar(children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/shopping_cart');
                },
                icon: const Icon(Icons.shopping_basket)),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                icon: const Icon(Icons.logout)),
          ])
        ],
      ),
      body: ListView(children: [
        GridView.extent(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          maxCrossAxisExtent: 300,
          children: shoppingList.map((item) => ItemCard(item: item)).toList(),
        ),
      ]),
    );
  }
}
