import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4E9), // Light orange background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Saved Address',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Saved Addresses'),
              SizedBox(height: 16),
              _buildAddressList(context),
              SizedBox(height: 24),
              _buildAddAddressButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.orange,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAddressList(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          _buildAddressItem(
            context,
            icon: Icons.home,
            title: 'Home',
            address:
                '1276D, Ranjit Nagar, Kharar bus stand,\nnear, New Aman city, Kharar\n140301',
          ),
          Divider(color: Colors.grey[300]),
          _buildAddressItem(
            context,
            icon: Icons.work,
            title: 'Work',
            address:
                '1276D, Ranjit Nagar, Kharar bus stand,\nnear, New Aman city, Kharar\n140301',
          ),
          Divider(color: Colors.grey[300]),
          _buildAddressItem(
            context,
            icon: Icons.people,
            title: 'Friends/Family',
            address:
                '1276D, Ranjit Nagar, Kharar bus stand,\nnear, New Aman city, Kharar\n140301',
          ),
        ],
      ),
    );
  }

  Widget _buildAddressItem(BuildContext context,
      {required IconData icon,
      required String title,
      required String address}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.orange[100],
            child: Icon(icon, size: 24, color: Colors.orange),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, size: 20, color: Colors.orange),
                      onPressed: () => _editAddress(context, title, address),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  address,
                  style: TextStyle(
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _editAddress(BuildContext context, String title, String currentAddress) {
  TextEditingController addressController =
      TextEditingController(text: currentAddress);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit $title Address'),
        content: TextField(
          controller: addressController,
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter your address',
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: Text('Save'),
            onPressed: () {
              // Save the new address logic here
              print('New address: ${addressController.text}');
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget _buildAddAddressButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      _showAddAddressBottomSheet(context);
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: Colors.orange,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(vertical: 12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add),
        SizedBox(width: 8),
        Text(
          'Add an address',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Future<void> _showAddAddressBottomSheet(BuildContext context) async {
  String selectedAddressType = 'Home';

  // Check and request location permission
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, handle accordingly
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location permission denied')),
      );
      return;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle accordingly
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Location permission denied forever')),
    );
    return;
  }

  // Get the current location
  Position position;
  try {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error getting location: $e')),
    );
    return;
  }

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.9,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            builder: (_, controller) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(position.latitude, position.longitude),
                          zoom: 14.4746,
                        ),
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        controller: controller,
                        padding: EdgeInsets.all(16),
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Enter address details',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            children: [
                              'Home',
                              'Work',
                              'Hotel',
                              'Friends/Family',
                              'Other'
                            ]
                                .map((type) => ChoiceChip(
                                      label: Text(type),
                                      selected: selectedAddressType == type,
                                      onSelected: (selected) {
                                        setState(() {
                                          selectedAddressType = type;
                                        });
                                      },
                                    ))
                                .toList(),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Receiver's Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Complete address',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Floor (optional)',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Nearby landmark',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Container(
                                width: 60,
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: '+91',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    labelText: "Receiver's Phone",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              // Implement address saving logic here
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Save Address',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    },
  );
}
