import 'package:flutter/material.dart';
import 'package:shopping_cart_app/components/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 65,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 20),
            Text("Dream Shopping",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text("Let's make your dreams come true ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 10,
                    fontWeight: FontWeight.w300)),
            SizedBox(
              height: 8,
            ),
            MyButton(
                child: Icon(Icons.arrow_forward),
                ontap: () {
                  Navigator.pushNamed(context, '/shop_page');
                })
          ],
        ),
      ),
    );
  }
}
