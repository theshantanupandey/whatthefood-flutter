import 'package:flutter/material.dart';

class FoodCart extends StatefulWidget {
  @override
  _FoodCartState createState() => _FoodCartState();
}

class _FoodCartState extends State<FoodCart> {
  List<OrderItem> orderItems = [
    OrderItem('Farmhouse Pizza', 'Overstory', 200, 2, 'assets/pizza.jpg'),
    OrderItem('Alfredo Pasta', 'Overstory', 200, 2, 'assets/pizza.jpg'),
    OrderItem('Garlic Bread', 'Overstory', 200, 2, 'assets/pizza.jpg'),
    OrderItem('Coca Cola - 250ml', 'Overstory', 60, 1, 'assets/pizza.jpg'),
  ];

  bool needCutlery = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Cart', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDeliveryTimeCard(),
              SizedBox(height: 20),
              Text(
                'Ordering',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ...orderItems.map((item) => _buildOrderItem(item)).toList(),
              SizedBox(height: 20),
              _buildOptionsCard(),
              SizedBox(height: 20),
              _buildCouponCard(),
              SizedBox(height: 20),
              _buildBillingDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryTimeCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.timer, color: Colors.red),
          SizedBox(width: 10),
          Text(
            'Delivery in 30 minutes',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(OrderItem item) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          children: [
            Image.asset(
              item.imagePath,
              width: 50,
              height: 50,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.desc,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '₹${item.price}',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _buildQuantityButton(Icons.remove, () {
                  setState(() {
                    if (item.qty > 1) item.qty--;
                  });
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '${item.qty}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                _buildQuantityButton(Icons.add, () {
                  setState(() {
                    item.qty++;
                  });
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, VoidCallback onPressed) {
    return Material(
      color: Colors.green,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildOptionsCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text('Add more & Save more'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to add more items screen
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.kitchen),
            title: Text('Custom cooking instructions'),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to custom instructions screen
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: Text('Need cutlery?'),
            trailing: Switch(
              value: needCutlery,
              onChanged: (value) {
                setState(() {
                  needCutlery = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCouponCard() {
    return Container(
      width: MediaQuery.of(context).size.width - 32, // 16 padding on each side
      child: Card(
        color: Colors.orange.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "'404MONEY' applied",
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                '₹125 savings',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBillingDetails() {
    int itemTotal =
        orderItems.fold(0, (sum, item) => sum + item.price * item.qty);
    int deliveryFee = 25;
    int totalSavings = 125;
    int convenienceFee = 3;
    int gstAndCharges = 10;
    int payable =
        itemTotal + deliveryFee - totalSavings + convenienceFee + gstAndCharges;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBillingRow('Item Total', '₹$itemTotal'),
            _buildBillingRow('Delivery Fee', '₹$deliveryFee'),
            _buildBillingRow('Total Savings', '-₹$totalSavings',
                isSavings: true),
            _buildBillingRow('Convenience Fee', '₹$convenienceFee'),
            _buildBillingRow('GST & Restaurant Charges', '₹$gstAndCharges'),
            Divider(),
            _buildBillingRow('Payable', '₹$payable', isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildBillingRow(String title, String amount,
      {bool isSavings = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isSavings ? Colors.red : Colors.black,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isSavings ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem {
  final String name;
  final String desc;
  final int price;
  int qty;
  final String imagePath;

  OrderItem(this.name, this.desc, this.price, this.qty, this.imagePath);
}
