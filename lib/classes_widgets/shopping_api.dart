import 'package:shopping_cart_1/classes_widgets/shopping_item.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShoppingItemApi {
  static Future<List<ShoppingItem>> getItem() async {
    var url = 'https://dummyjson.com/products';
    final response = await http.get(Uri.parse(url));
    // final response = await http.get(uri);
    Map data = jsonDecode(response.body);
    List temp = [];

    for (var i in data['products']) {
      temp.add(i);
    }
    return ShoppingItem.itemsFromSnapshot(temp);
  }
}
