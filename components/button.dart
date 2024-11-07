import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? ontap;
  final Widget child;
  const MyButton({super.key, this.ontap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 120,
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
