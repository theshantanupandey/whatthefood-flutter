import 'package:flutter/material.dart';

Widget userCard(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/userProfile');
    },
    child: Card(
      margin: const EdgeInsets.all(15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFFFD8469),
              backgroundImage: AssetImage('assets/profile_picture.png'),
            ),
            SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shantanu Pandey',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '1276D, Garden colony, Ranjit Nagar, Kharar Bus Stand, 140301',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text('POINTS',
                      style: TextStyle(fontSize: 10, color: Colors.orange)),
                  Text('456',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange)),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
