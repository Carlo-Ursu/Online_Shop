import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopping_cart_1/classes_widgets/item_imageBuilder.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_1/classes_widgets/item_details.dart';
import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';

class ItemCard extends StatefulWidget {
  final ShoppingItem item;
  final Function badgeCallback;
  final int itemsInCart;

  const ItemCard({
    super.key,
    required this.item,
    required this.badgeCallback,
    required this.itemsInCart,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  String displayed = 'none';
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
            imageDisplay(),
            Text(
              widget.item.title,
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20.0,
                ),
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
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                        'Details',
                      ),
                      onPressed: () {
                        setState(() {
                          displayed == 'none'
                              ? displayed = 'fewDetails'
                              : displayed = 'moreDetails';
                        });
                        if (displayed == 'moreDetails') {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text(
                                      widget.item.title,
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: SizedBox(
                                      height: 100,
                                      child: Column(
                                        children: [
                                          Text(
                                            widget.item.specs,
                                            style: TextStyle(
                                              color: Colors.amber,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 7, 0, 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Price is: ${widget.item.price}\$',
                                                  style: TextStyle(
                                                    color: Colors.amber,
                                                  ),
                                                ),
                                                Text(
                                                  'Available stock: ${widget.item.stock}',
                                                  style: TextStyle(
                                                    color: Colors.amber,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                        }
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
                          widget.badgeCallback();
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
    if (displayed != 'none') {
      return Details(item: widget.item);
    } else {
      return Text('');
    }
  }

  imageDisplay() {
    if (widget.item.url.length > 1) {
      return CarouselSlider.builder(
          options: CarouselOptions(height: 150),
          itemCount: widget.item.url.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = widget.item.url[index];
            return buildImage(urlImage, index);
          });
    } else {
      return Image.network(
        widget.item.url[0],
        width: 150,
        fit: BoxFit.fill,
      );
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
