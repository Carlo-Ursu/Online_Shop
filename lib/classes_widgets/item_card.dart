import 'package:flutter/material.dart';
import 'package:shopping_cart_1/classes_widgets/item_details.dart';
import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';

class ItemCard extends StatefulWidget {
  final ShoppingItem item;
  const ItemCard({super.key, required this.item});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  bool displayed = false;
  String sometext = '';
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Container(
        width: 350,
        height: 350,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image(
              image: AssetImage(widget.item.url),
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            Text(
              widget.item.title,
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            const SizedBox(height: 10.0),
            Column(
              children: [
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      label: const Text(
                          style: TextStyle(color: Colors.amber), 'Details'),
                      onPressed: () {
                        setState(() {
                          displayed = !displayed;
                        });
                      },
                      icon: const Icon(color: Colors.amber, Icons.more),
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                      ),
                      label: const Text(
                          style: TextStyle(color: Colors.amber), 'Add to cart'),
                      onPressed: () {
                        setState(() {
                          widget.item.isInCart = true;
                          widget.item.counter = 1;
                        });
                      },
                      icon:
                          const Icon(color: Colors.amber, Icons.shopping_cart),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            showDetails(),
          ],
        ),
      ),
    );
  }

  showDetails() {
    if (displayed) {
      return Details(item: widget.item);
    } else {
      return Text('');
    }
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
