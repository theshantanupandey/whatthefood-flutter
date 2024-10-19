import 'package:flutter/material.dart';

Widget search_box() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 15),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 1),
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Search Here',
        border: InputBorder.none,
        icon: Icon(Icons.search, color: Colors.orange),
        suffixIcon: Icon(Icons.mic, color: Colors.orange),
      ),
    ),
  );
}
