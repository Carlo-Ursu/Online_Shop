import 'package:flutter/material.dart';
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
        width: 300,
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
            Text(widget.item.title),
            const SizedBox(height: 10.0),
            Column(
              children: [
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FloatingActionButton.extended(
                      isExtended: false,
                      backgroundColor: Colors.white,
                      label: const Text(
                          style: TextStyle(color: Colors.amber), 'Details'),
                      onPressed: () {
                        setState(() {
                          displayed = !displayed;
                        });
                      },
                      icon: const Icon(color: Colors.amber, Icons.more),
                    ),
                    FloatingActionButton.extended(
                      backgroundColor: Colors.white,
                      label: const Text(
                          style: TextStyle(color: Colors.amber), 'Add to cart'),
                      onPressed: () {},
                      icon:
                          const Icon(color: Colors.amber, Icons.shopping_cart),
                    ),
                  ],
                ),
                // Row(
                //   children: [
                //     IconButton(
                //       icon: const Icon(Icons.add),
                //       splashRadius: 15.0,
                //       onPressed: () {
                //         setState(() {
                //           widget.item.counter += 1;
                //         });
                //       },
                //     ),
                //     IconButton(
                //       icon: const Icon(Icons.remove),
                //       splashRadius: 15.0,
                //       onPressed: () {
                //         setState(() {
                //           if (widget.item.counter == 0) {
                //             widget.item.counter = 0;
                //           } else {
                //             widget.item.counter -= 1;
                //           }
                //         });
                //       },
                //     ),
                //   ],
                // ),
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

class Details extends StatelessWidget {
  const Details({super.key, required this.item});
  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(item.price),
          Text(item.url),
          Text('${item.left}'),
        ],
      ),
    );
  }
}
