import 'package:flutter/material.dart';

Widget profileMenuButton(
    BuildContext context, IconData icon, String label, String page) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange[50],
      foregroundColor: Colors.deepOrange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 16),
    ),
    onPressed: () {
      Navigator.pushNamed(context, page);
    },
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 50),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    ),
  );
}
