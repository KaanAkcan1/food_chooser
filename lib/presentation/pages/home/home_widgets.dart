import 'package:flutter/material.dart';

class CustomHomeButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomHomeButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
