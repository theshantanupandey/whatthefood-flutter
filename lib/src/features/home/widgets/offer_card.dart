import 'package:flutter/material.dart';

Widget offerSection() {
  return Container(
    height: 130,
    child: ListView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10),
      children: [
        _buildOfferItem('Offers', 'Flat Discounts', Icons.percent,
            Colors.lightBlueAccent, Colors.blueAccent),
        _buildOfferItem(
            'Health Tips',
            'Top Dieticians',
            Icons.health_and_safety_outlined,
            Colors.lightGreenAccent,
            Colors.greenAccent),
        _buildOfferItem('Ayurvedics', 'Explore',
            Icons.accessibility_new_rounded, Colors.tealAccent, Colors.teal),
        _buildOfferItem(
            'Watch Videos',
            'Explore',
            Icons.video_collection_rounded,
            Colors.redAccent,
            Colors.deepOrangeAccent),
      ],
    ),
  );
}

Widget _buildOfferItem(String title, String subtitle, IconData icon,
    Color gradientStart, Color gradientEnd) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10),
    width: 200,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          colors: [gradientStart, gradientEnd],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(height: 5),
                  Text(subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.white70)),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Icon(Icons.arrow_forward, color: gradientEnd, size: 20),
              ),
            ],
          ),
        ),
        Positioned(
          right: 20,
          top: 30,
          child: Icon(icon, size: 40, color: Colors.white.withOpacity(0.5)),
        ),
      ],
    ),
  );
}
