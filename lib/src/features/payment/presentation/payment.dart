import 'package:flutter/material.dart';

class paymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Payment Methods',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Saved Cards', Icons.credit_card),
              _buildCardItem('One Card', '**** 8922', 'visa'),
              _buildCardItem('BoB Card', '**** 6543', 'mas'),
              _buildAddNewCard(),
              SizedBox(height: 24),
              _buildSectionTitle('Wallets', Icons.account_balance_wallet),
              _buildWalletItem(
                  'Paytm Payments Bank Wallet', '9599575931', '₹467.0', 'pytm'),
              _buildWalletItem('AmazonPay', '', 'Link Account', 'amzn'),
              _buildWalletItem('Mobikwik', '', 'Link Account', 'mobi'),
              _buildWalletItem('PhonePe', '', 'Link Account', 'phonepe'),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange[700]),
          SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildCardItem(String name, String number, String type) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Image.asset('assets/$type.png', width: 48),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(number),
        trailing: TextButton(
          child: Text('Manage', style: TextStyle(color: Colors.orange[700])),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _buildAddNewCard() {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading:
            Icon(Icons.add_circle_outline, color: Colors.orange[700], size: 32),
        title:
            Text('Add new card', style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/visa.png', width: 32),
            SizedBox(width: 8),
            Image.asset('assets/mas.png', width: 32),
            SizedBox(width: 8),
            Image.asset('assets/add.png', width: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletItem(
      String name, String number, String balance, String logo) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Image.asset('assets/$logo.png', width: 48),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: number.isNotEmpty ? Text(number) : null,
        trailing: balance.startsWith('₹')
            ? Text(balance,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green))
            : TextButton(
                child: Text(balance,
                    style: TextStyle(color: Colors.deepOrange[700])),
                onPressed: () {},
              ),
      ),
    );
  }
}
