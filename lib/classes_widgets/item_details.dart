import 'package:flutter/material.dart';
import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.item});
  final ShoppingItem item;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '${item.price} \$',
            style: TextStyle(
                color: Colors.amber,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800),
          ),
          Text(
            item.specs,
            style: TextStyle(
              color: Colors.amber,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            '${item.left}',
            style: TextStyle(
                color: Colors.amber,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
