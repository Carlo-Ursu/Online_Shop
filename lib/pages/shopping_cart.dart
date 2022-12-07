import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_cart_1/classes_widgets/cart_items.dart';
import 'package:shopping_cart_1/classes_widgets/data.dart';
import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';
import 'package:shopping_cart_1/pages/login.dart';

class ShoppingCart extends StatefulWidget {
  ShoppingCart({super.key, required this.newUsername});
  String newUsername;

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  Iterable<ShoppingItem> myCart = shoppingList.where((item) => item.isInCart);
  int finalPrice = 0;

  callback() {
    setState(() {
      finalPrice = 0;
      for (var item in myCart) {
        finalPrice += item.price * item.counter;
      }
    });
  }

  initPrice() {
    finalPrice = 0;
    for (var item in myCart) {
      finalPrice += item.price * item.counter;
    }
    return finalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.newUsername}\'s Cart'),
        backgroundColor: Colors.amber[800],
        actions: [
          IconButton(
              onPressed: () {
                goToOtherPage(context, Login(), '/');
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: AlignedGridView.count(
        crossAxisCount: 1,
        mainAxisSpacing: 3,
        crossAxisSpacing: 2,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Wrap(
                alignment: WrapAlignment.spaceAround,
                children: myCart
                    .map((item) => CartItem(
                          item: item,
                          finalPrice: 0,
                          callback: callback,
                        ))
                    .toList(),
              ),
              Container(
                margin: EdgeInsets.all(6),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            style: TextStyle(color: Colors.amber, fontSize: 30),
                            'Total value'),
                        Text('${initPrice()}',
                            style:
                                TextStyle(color: Colors.amber, fontSize: 25)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

goToOtherPage(BuildContext context, Widget destination, String title) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => destination,
      settings: RouteSettings(name: title),
    ),
  );
}
