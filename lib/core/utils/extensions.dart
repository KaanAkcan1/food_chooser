import 'package:flutter/material.dart';

extension StringExtensions on String {
  // String'e baş harf büyütme
  String get capitalize => '${this[0].toUpperCase()}${this.substring(1)}';
}

extension BuildContextExtensions on BuildContext {
  // BuildContext üzerinde snackbar gösterme
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}
