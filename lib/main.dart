import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_1/firebase_options.dart';
import 'package:shopping_cart_1/pages/login.dart';
import 'package:shopping_cart_1/pages/shop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Shop(
        newUsername: '',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
