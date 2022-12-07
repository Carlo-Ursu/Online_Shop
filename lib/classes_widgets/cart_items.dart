import 'package:flutter/material.dart';
import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';

class CartItem extends StatefulWidget {
  final ShoppingItem item;
  final int finalPrice;
  final Function callback;

  CartItem(
      {super.key,
      required this.item,
      required this.finalPrice,
      required this.callback,});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.item.thumbnail),
                  radius: 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    widget.item.title,
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      color: Colors.amber,
                      icon: const Icon(Icons.add),
                      splashRadius: 15.0,
                      onPressed: () {
                        setState(() {
                          if (widget.item.stock == widget.item.counter) {
                            widget.item.counter = widget.item.stock;
                          } else {
                            widget.item.counter++;
                          }
                          widget.callback();
                        });
                      },
                    ),
                    IconButton(
                      color: Colors.amber,
                      icon: const Icon(Icons.remove),
                      splashRadius: 15.0,
                      onPressed: () {
                        setState(() {
                          if (widget.item.counter == 0) {
                            widget.item.counter = 0;
                          } else {
                            widget.item.counter -= 1;
                          }
                          widget.callback();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '${widget.item.counter}',
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            IconButton(
              color: Colors.amber,
              icon: const Icon(Icons.delete),
              splashRadius: 15.0,
              onPressed: () {
                setState(() {
                  widget.item.isInCart = false;
                  widget.callback();
                });
              },
            ),
            Text(
              '${widget.item.counter * widget.item.price}\$',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
