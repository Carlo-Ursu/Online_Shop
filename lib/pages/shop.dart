// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_cart_1/classes_widgets/data.dart';
import 'package:shopping_cart_1/classes_widgets/item_card.dart';
import 'package:shopping_cart_1/pages/login.dart';
import 'package:shopping_cart_1/pages/shopping_cart.dart';

class Shop extends StatelessWidget {
  Shop({super.key, required this.newUsername});
  String newUsername;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello $newUsername'),
        backgroundColor: Colors.amber[800],
        actions: [
          ButtonBar(children: [
            IconButton(
                onPressed: () {
                  goToOtherPage(context, ShoppingCart(), 'cart');
                },
                icon: const Icon(Icons.shopping_basket)),
            IconButton(
                onPressed: () {
                  goToOtherPage(context, Login(), '/');
                },
                icon: const Icon(Icons.logout)),
          ])
        ],
      ),
      body: AlignedGridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 3,
        crossAxisSpacing: 2,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Wrap(
            alignment: WrapAlignment.spaceAround,
            children: shoppingList.map((item) => ItemCard(item: item)).toList(),
          );
        },
      ),
    );
  }
}

goToOtherPage(BuildContext context, Widget destination, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => destination,
      settings: RouteSettings(name: title),
    ),
  );
}
