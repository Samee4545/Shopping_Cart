import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/models/shop.dart';
import 'package:shopping_cart_app/pages/cart_page.dart';
import 'package:shopping_cart_app/pages/intro_page.dart';
import 'package:shopping_cart_app/pages/shop_page.dart';
import 'package:shopping_cart_app/theme/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => Shop(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/cart_page': (context) => CartPage(),
      },
      theme: lightTheme,
    );
  }
}
