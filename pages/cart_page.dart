import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/components/appbar.dart';
import 'package:shopping_cart_app/components/button.dart';
import 'package:shopping_cart_app/models/product.dart';
import 'package:shopping_cart_app/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    void removeFromCart(BuildContext context, Product product) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Remove Product from Cart'),
          content:
              Text('Do you want to remove ${product.name} from your cart?'),
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
                context.read<Shop>().removeProductFromCart(product);
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
    }

    void payButtonPressed() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('user wants to Pay!'),
          content: Text(
              'Your payment of \$${cart.fold(0.0, (a, b) => a + b.price).toStringAsFixed(2)} was successful.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Cancel")),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: MyAppBar("Cart Page", null),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text(
                      'Your cart is empty',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle:
                            Text("Price: \$${item.price.toStringAsFixed(2)}"),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            removeFromCart(context, item);
                          },
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: MyButton(
                child: Center(child: Text("PAY NOW!")),
                ontap: () {
                  payButtonPressed();
                }),
          )
        ],
      ),
    );
  }
}
