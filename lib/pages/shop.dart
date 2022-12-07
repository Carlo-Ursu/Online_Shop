import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_cart_1/classes_widgets/data.dart';
import 'package:shopping_cart_1/classes_widgets/item_card.dart';
import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';
import 'package:shopping_cart_1/pages/login.dart';
import 'package:shopping_cart_1/pages/shopping_cart.dart';

class Shop extends StatefulWidget {
  Shop({super.key, required this.newUsername});
  String newUsername;

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  String search = '';
  Iterable<ShoppingItem> searchResults = shoppingList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              flex: 1,
              child: TextField(
                style: TextStyle(fontSize: 20.0, color: Colors.amber),
                onChanged: (value) {
                  setState(() {
                    search = value;
                    searchResults = shoppingList
                        .where((item) => item.title
                            .toLowerCase()
                            .contains(search.toLowerCase().trim()))
                        .toList();
                  });
                },
                cursorColor: Colors.amber,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.amber,
                  ),
                  hintText: "Search for a product",
                  hintStyle: TextStyle(color: Colors.amber),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 25.0),
                      borderRadius: BorderRadius.circular(15.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 32.0),
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
                child: Text(
                  'Hello, ${widget.newUsername}',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.amber[800],
        actions: [
          ButtonBar(children: [
            IconButton(
                onPressed: () {
                  goToOtherPage(
                      context,
                      ShoppingCart(
                        newUsername: widget.newUsername,
                      ),
                      'cart');
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
            children:
                searchResults.map((item) => ItemCard(item: item)).toList(),
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
