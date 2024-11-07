import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/components/appbar.dart';
import 'package:shopping_cart_app/components/my_drawer.dart';
import 'package:shopping_cart_app/components/productTile.dart';
import 'package:shopping_cart_app/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: MyAppBar(
          "Shop",
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart_page");
              },
              icon: Icon(Icons.shopping_cart))),
      drawer: MyDrawer(),
      body: ListView(
        children: [
          SizedBox(
            height: 25,
          ),
          Center(
            child: Text("Pick from the selected list of premium products",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary)),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: ((context, index) {
                  final product = products[index];
                  return ProductListTile(product: product);
                })),
          ),
        ],
      ),
    );
  }
}
