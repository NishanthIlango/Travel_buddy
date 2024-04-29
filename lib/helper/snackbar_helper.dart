import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showErrorSnackBar(BuildContext context, String message) {
    if (context != null && ScaffoldMessenger.of(context) != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ));
    }
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    if (context != null && ScaffoldMessenger.of(context) != null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ));
    }
  }
}
