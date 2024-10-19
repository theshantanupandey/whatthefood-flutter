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

class DinnerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Dinner'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              _showBottomSheet(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          //_buildDateSection(),
          _buildWeekDaySelector(),
          _buildSearchBar(),
          //_buildFilterButtons(), // Add the filter buttons here
          Expanded(
            child: ListView(
              children: [
                _buildMealItem(
                    'South Indian Meal',
                    '2-dal | 2-vada | lemon rice\ncoconut chutney | Sambar',
                    4.5,
                    70,
                    'assets/south_indian_meal.png'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.fastfood), label: 'Food'),
          BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining), label: 'Delivery'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), label: 'Cart'),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.orangeAccent),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Here',
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.mic, color: Colors.orangeAccent),
        ],
      ),
    );
  }

/*  Widget _buildFilterButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width:20),
        _buildFilterButton('Sort', Icons.sort),
        //_buildFilterButton('Cuisine', Icons.filter_alt_outlined),
       //_buildFilterButton('Regular', Icons.restaurant_menu_outlined),
      ],
    );
  }*/

/*  Widget _buildFilterButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.orange),
      label: Text(label, style: TextStyle(color: Colors.black54)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: BorderSide(color: Colors.orange),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }*/

  Widget _buildMealItem(String name, String description, double rating,
      double price, String imagePath) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white,
                //color: Color(0xFFE3D4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Updated color profile
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.black
                          .withOpacity(0.7), // Updated color profile
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              color: Colors.black, // Updated color profile
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Rs $price',
                        style: TextStyle(
                          color: Colors.orange, // Updated color profile
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('ADD'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.orange,
                          // Updated color profile
                          side: const BorderSide(color: Colors.orange),
                          // Updated color profile
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        height: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Important Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Any changes to your meals must be made at least 12 hours prior to meal time.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );
    },
  );
}
