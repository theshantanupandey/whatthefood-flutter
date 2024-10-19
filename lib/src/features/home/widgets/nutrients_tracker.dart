import 'package:flutter/material.dart';

Widget nutrientTracker() {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    // Light salmon color for the background
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildNutrientItem('MACRO', 60, Colors.purple),
          SizedBox(height: 10),
          buildNutrientItem('MICRO', 80, Colors.red),
          SizedBox(height: 10),
          buildNutrientItem('CALORIES', 45, Colors.yellow),
        ],
      ),
    ),
  );
}

Widget buildNutrientItem(String label, int percentage, Color color) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              //color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$percentage%',
            style: TextStyle(
              //color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      SizedBox(height: 5),
      LinearProgressIndicator(
        value: percentage / 100,
        backgroundColor: Colors.white70.withOpacity(1),
        valueColor: AlwaysStoppedAnimation<Color>(color),
        minHeight: 10,
        borderRadius: BorderRadius.circular(5),
      ),
    ],
  );
}
