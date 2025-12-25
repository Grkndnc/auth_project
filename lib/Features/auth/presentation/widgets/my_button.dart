import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
