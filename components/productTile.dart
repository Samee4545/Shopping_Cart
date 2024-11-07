import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/models/product.dart';
import 'package:shopping_cart_app/models/shop.dart';

class ProductListTile extends StatelessWidget {
  final Product product;
  const ProductListTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    void addToCart(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Product Added to Cart'),
                content:
                    Text('Do you want to add ${product.name} to your cart.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      context.read<Shop>().addProductToCart(product);
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ));
    }

    return Container(
      padding: EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.favorite),
                      )),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  product.description,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.price.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                      onPressed: () {
                        addToCart(context);
                      },
                      icon: Icon(Icons.add)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
