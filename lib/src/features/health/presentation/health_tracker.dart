import 'package:flutter/material.dart';

class HealthTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAE7E1),
        title: Text(
          'Health Tracker',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFFFAE7E1),
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _buildTodayProgress(),
            SizedBox(height: 20),
            _buildMealLog(),
            SizedBox(height: 20),
            _buildMacroBreakup(),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayProgress() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Progress",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                'View more',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCalorieBox(),
              _buildCircularProgress('Proteins', 0.80, Colors.orange),
              _buildCircularProgress('Carbs', 0.85, Colors.purple),
              _buildCircularProgress('Fats', 0.90, Colors.blue),
            ],
          ),
          SizedBox(height: 20),
          Divider(color: Colors.grey.shade300),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.fitness_center, size: 22, color: Colors.blueAccent),
              SizedBox(width: 8),
              Text(
                "Keep the pace! You're doing great.",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalorieBox() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(Icons.local_fire_department, color: Colors.white),
          Text(
            '1,284',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Text(
            'Calories',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildCircularProgress(String label, double percent, Color color) {
    return Column(
      children: [
        Container(
          width: 60, // explicitly defined width
          height: 60, // explicitly defined height
          child: Stack(
            children: [
              CircularProgressIndicator(
                value: percent,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(color),
                strokeWidth: 8,
              ),
              Center(
                child: Text(
                  '${(percent * 100).toInt()}%',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildMealLog() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Meal Log',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 16),
          _buildMealItem(),
          _buildMealItem(),
          _buildMealItem(),
        ],
      ),
    );
  }

  Widget _buildMealItem() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Meal score: 82',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('RDA 35%', style: TextStyle(fontSize: 12)),
                Text('Macro 82', style: TextStyle(fontSize: 12)),
                Text('Micro 82', style: TextStyle(fontSize: 12)),
                Text('Calories 250Kcal', style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              'High in fiber and vitamins C and E, this meal supports digestion and boosts your immune system.',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMacroBreakup() {
    return Column(
      children: [
        _buildMacroBreakupItem('Macro', 0.70, Colors.green),
        _buildMacroBreakupItem('Micro', 0.85, Colors.orange),
        _buildMacroBreakupItem('Nutrient', 0.90, Colors.blue),
      ],
    );
  }

  Widget _buildMacroBreakupItem(String macro, double value, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text('$macro Breakup',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 2,
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_downward),
        ],
      ),
    );
  }
}
