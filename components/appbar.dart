import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? name;
  final IconButton? iconButton;
  const MyAppBar(this.name, this.iconButton, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(name!),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        actions: iconButton != null ? [iconButton!] : []);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
