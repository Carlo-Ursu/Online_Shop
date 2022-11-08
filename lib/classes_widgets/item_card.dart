import 'package:flutter/material.dart';
import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';

class ItemCard extends StatefulWidget {
  final ShoppingItem item;
  const ItemCard({super.key, required this.item});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10),
        // width: 300,
        // height: 300,
        child: Column(
          children: [
            Image(
              image: AssetImage(widget.item.url),
              width: 100,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10.0),
            Text(widget.item.price),
            Column(
              children: [
                const SizedBox(height: 20.0),
                FloatingActionButton.extended(
                  focusElevation: 0,
                  backgroundColor: Colors.white,
                  label: const Text(
                      style: TextStyle(color: Colors.amber), 'Add to cart'),
                  onPressed: () {},
                  icon: const Icon(color: Colors.amber, Icons.shopping_cart),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      splashRadius: 15.0,
                      onPressed: () {
                        setState(() {
                          widget.item.counter += 1;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      splashRadius: 15.0,
                      onPressed: () {
                        setState(() {
                          if (widget.item.counter == 0) {
                            widget.item.counter = 0;
                          } else {
                            widget.item.counter -= 1;
                          }
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Text('${widget.item.counter}'),
          ],
        ),
      ),
    );
  }
}
