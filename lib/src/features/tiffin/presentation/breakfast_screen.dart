import 'package:flutter/material.dart';
//import 'TiffinServicePage.dart';

Widget _buildWeekDaySelector() {
  return Container(
    height: 80,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _buildDayCard('Mon', '12', true),
        _buildDayCard('Tue', '13', true),
        _buildDayCard('Wed', '14', false),
        _buildDayCard('Thu', '15', false),
        _buildDayCard('Fri', '16', false),
        _buildDayCard('Sat', '17', false),
        _buildDayCard('Sun', '18', false),
        _buildDayCard('Mon', '19', false),
        _buildDayCard('Tue', '20', false),
        _buildDayCard('Wed', '21', false),
        _buildDayCard('Thu', '22', false),
        _buildDayCard('Fri', '23', false),
        _buildDayCard('Sat', '24', false),
        _buildDayCard('Sun', '25', false),
        _buildDayCard('Mom', '26', false),
        _buildDayCard('Tue', '27', false),
        _buildDayCard('Wed', '27', false),
        _buildDayCard('Thu', '29', false),
        _buildDayCard('Fri', '30', false),
        _buildDayCard('Sat', '31', false),
        _buildDayCard('Sun', '01', false),
      ],
    ),
  );
}

Widget _buildDayCard(String day, String date, bool isPast) {
  return Card(
    color: isPast ? Colors.green : Colors.orangeAccent,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(day, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 4), // Adds space between day and date
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white, // Background color for the date box
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
            child: Text(
              date,
              style: TextStyle(
                color: isPast ? Colors.green : Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class BreakfastScreen extends StatelessWidget {
  const BreakfastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text('Break Fast'),
      )),
    );
  }
}
