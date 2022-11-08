import 'package:flutter/material.dart';
import 'package:shopping_cart_1/pages/login.dart';
import 'package:shopping_cart_1/pages/shop.dart';

void main() => runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Login(),
          '/shop': (context) => Shop(),
          // '/shopping_cart': (context) => ShoppingCart(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
