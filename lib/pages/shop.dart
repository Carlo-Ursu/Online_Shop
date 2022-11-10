import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';
import 'package:shopping_cart_1/classes_widgets/item_card.dart';
import 'package:shopping_cart_1/classes_widgets/routes.dart';

class Shop extends StatelessWidget {
  Shop({super.key});

  List<ShoppingItem> shoppingList = [
    ShoppingItem(url: 'assets/imac.jpeg', price: '1000\$', counter: 0),
    ShoppingItem(url: 'assets/macbookair.jpeg', price: '1100\$', counter: 0),
    ShoppingItem(url: 'assets/macbookpro.jpeg', price: '1200\$', counter: 0),
  ];

  Widget itemTemplate(item) {
    return ItemCard(item: item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
        backgroundColor: Colors.amber[800],
        actions: [
          ButtonBar(children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.cart);
                },
                icon: const Icon(Icons.shopping_basket)),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                icon: const Icon(Icons.logout)),
          ])
        ],
      ),
      body: AlignedGridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
              children:
                  shoppingList.map((item) => ItemCard(item: item)).toList());
        },
      ),
      //   ListView(children: [
      //   GridView.extent(
      //     physics: NeverScrollableScrollPhysics(),
      //     shrinkWrap: true,
      //     maxCrossAxisExtent: 300,
      //     children: shoppingList.map((item) => ItemCard(item: item)).toList(),
      //   ),
      // ]),
    );
  }
}
