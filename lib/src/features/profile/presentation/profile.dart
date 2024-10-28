import 'package:flutter/material.dart';
import 'package:wtfeua/src/features/auth/function/auth_function.dart';
import 'package:wtfeua/src/features/profile/widgets/profile_menu_button.dart';

class userProfile extends StatelessWidget {
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
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileHeader(),
            SizedBox(height: 16),
            _buildMembershipButton(),
            SizedBox(height: 16),
            _buildInfoCard(),
            SizedBox(height: 24),
            _buildSectionTitle('Quick Actions'),
            SizedBox(height: 8),
            _buildMenuButtons(context),
            SizedBox(height: 24),
            _buildReferButton(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.deepOrange,
            child: Icon(Icons.person, size: 40, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shantanu Pandey',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('+91 9599575931',
                    style: TextStyle(color: Colors.grey[600])),
                Text('shantanu.7pandey@gmail.com',
                    style: TextStyle(color: Colors.grey[600])),
                SizedBox(height: 4),
                Text('Standard User',
                    style: TextStyle(
                        color: Colors.deepOrange, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMembershipButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, color: Colors.white),
            SizedBox(width: 8),
            Text(
              '404 Membership',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              _buildInfoRow('Total savings', '₹650', Colors.orange),
              Divider(),
              _buildInfoRow('404 Points', '450', Colors.black),
              Divider(),
              _buildInfoRow('Health Rating', '4.0*', Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
          Text(
            value,
            style: TextStyle(
                fontSize: 16, color: valueColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMenuButtons(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          profileMenuButton(
            context,
            Icons.list_alt,
            'Orders',
            '/orders',
            () {},
          ),
          profileMenuButton(
            context,
            Icons.help_outline,
            'Help',
            '/help',
            () {},
          ),
          profileMenuButton(
            context,
            Icons.location_on_outlined,
            'Address',
            '/address',
            () {},
          ),
          profileMenuButton(
            context,
            Icons.credit_card,
            'Payment',
            '/payment',
            () {},
          ),
          profileMenuButton(
            context,
            Icons.description_outlined,
            'Health Report',
            '/healthReport',
            () {},
          ),
          profileMenuButton(
            context,
            Icons.logout,
            'Log Out',
            '/signIn',
            () async {
              await signOut(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReferButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border),
            SizedBox(width: 8),
            Text('Refer and Earn', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
