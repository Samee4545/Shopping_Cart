import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function()? ontap;
  const MyListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 8),
      child: ListTile(
        leading:
            Icon(icon, color: Theme.of(context).colorScheme.inversePrimary),
        title: Text(title,
            style:
                TextStyle(color: Theme.of(context).colorScheme.inversePrimary)),
        onTap: ontap,
      ),
    );
  }
}
