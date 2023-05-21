import 'package:flutter/material.dart';
import 'package:quickpass/adminmod/addmonument.dart';

import 'adminviewmonument.dart';
import 'editmonu.dart';
import 'monumenthistory.dart';

class AdminUserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Organization User Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome, Organization User!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Add Monument'),
            onTap: () {
              // Handle add monument functionality
              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                             AddMonumentScreen ()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit Monument'),
            onTap: () {
              // Handle edit monument functionality
              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                             EditMonumentScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('View Bookings'),
            onTap: () {
              // Handle view bookings functionality
               Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                             ViewMonumentBookingScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('View Bookings History'),
            onTap: () {
              // Handle view bookings  history functionality
              Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                             BookingHistoryScreen()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.star),
            title: const Text('Rate Monuments'),
            onTap: () {
              // Handle rating functionality
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RateMonumentsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RateMonumentsScreen extends StatefulWidget {
  @override
  _RateMonumentsScreenState createState() => _RateMonumentsScreenState();
}

class _RateMonumentsScreenState extends State<RateMonumentsScreen> {
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rate Monuments'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rate the Monuments',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Monument 1',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Slider(
              value: _rating,
              onChanged: (newValue) {
                setState(() {
                  _rating = newValue;
                });
              },
              min: 0,
              max: 5,
              divisions: 5,
              label: _rating.toString(),
            ),
            SizedBox(height: 16.0),
            // Text(
            //   'Monument 2',
            //   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 8.0),
            // Slider(
            //   value: _rating,
            //   onChanged: (newValue) {
            //     setState(() {
            //       _rating = newValue;
            //     });
            //   },
            //   min: 0,
            //   max: 5,
            //   divisions: 5,
            //   label: _rating.toString(),
            // ),
            SizedBox(height: 32.0),
            // RaisedButton(
            //   onPressed: () {
            //     // Handle submit rating functionality
            //   },
            //   color: Colors.blue,
            //   textColor: Colors.white,
            //   child: Text('Submit'),
            // ),
             ElevatedButton(
              child: const Text('Submit'),
              onPressed: () {
                

              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold)),
              ),
          ],
        ),
      ),
    );
  }
}

