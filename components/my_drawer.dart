import 'package:flutter/material.dart';
import 'package:shopping_cart_app/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Icon(Icons.shopping_bag,
                      size: 65,
                      color: Theme.of(context).colorScheme.inversePrimary)),
              SizedBox(
                height: 25,
              ),
              MyListTile(
                  icon: Icons.home,
                  title: "Shop",
                  ontap: () {
                    Navigator.pop(context);
                  }),
              MyListTile(
                  icon: Icons.shopping_cart,
                  title: "Cart",
                  ontap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/cart_page");
                  }),
              MyListTile(
                  icon: Icons.settings,
                  title: "Settings",
                  ontap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/settings_page");
                  }),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: MyListTile(
                icon: Icons.logout,
                title: "Logout",
                ontap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/Logout_Page");
                }),
          ),
        ],
      ),
    );
  }
}
