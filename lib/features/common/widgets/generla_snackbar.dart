import 'package:flutter/material.dart';

void showGeneralSnackbar(BuildContext context, Object e) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: Colors.grey.shade700,
      content: Text(e.toString()),
      showCloseIcon: false,
      margin: const EdgeInsets.only(
        bottom: 50,
        right: 20,
        left: 20,
      ),
    ),
  );
}
