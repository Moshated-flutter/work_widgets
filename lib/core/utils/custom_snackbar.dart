import 'package:flutter/material.dart';

class CustomSnackBar {
  static show(context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontFamily: 'Lato'
            ),
          ),
          backgroundColor: color,
        )
    );
  }
}
