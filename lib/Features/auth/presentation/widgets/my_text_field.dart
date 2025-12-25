import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.obscureText,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          filled: true,

          fillColor: Theme.of(context).colorScheme.secondary,

          // when you are typing..
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(8),
          ),

          // when you are not typing
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
