import 'package:flutter/material.dart';

Widget BottomNavBar(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 5,
        ),
      ],
    ),
    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
    // Increased horizontal margin
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        bottomNavItem(context, Icons.home, 0),
        bottomNavItem(context, Icons.store, 1),
        bottomNavItem(context, Icons.shopping_cart, 2),
      ],
    ),
  );
}

Widget bottomNavItem(BuildContext context, IconData icon, int index) {
  bool isSelected =
      index == 0; // Assuming home is always selected for this example
  return GestureDetector(
    onTap: () {
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/home');
          break;
        case 1:
          // Navigate to store page
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/cart');
          break;
      }
    },
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.orange : Colors.black54,
        size: 28,
      ),
    ),
  );
}
