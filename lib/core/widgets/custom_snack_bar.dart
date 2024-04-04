import 'package:flutter/material.dart';

showSnackBar({
  required String text,
  required Color color,
  context,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      backgroundColor: color,
    ),
  );
}
