import 'package:flutter/material.dart';

import 'bookingscreen.dart';

class MonumentDetailScreen extends StatefulWidget {
  final String monumentName;
  final String description;
  final String imageUrl;

  MonumentDetailScreen({
    required this.monumentName,
    required this.description,
    required this.imageUrl,
  });

  @override
  _MonumentDetailScreenState createState() => _MonumentDetailScreenState();
}

class _MonumentDetailScreenState extends State<MonumentDetailScreen> {
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.monumentName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  Text(
                    widget.monumentName,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    'Rating: $_rating',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Slider(
                    value: _rating,
                    onChanged: (newValue) {
                      setState(() {
                        _rating = newValue;
                      });
                    },
                    min: 0.0,
                    max: 5.0,
                    divisions: 5,
                    label: _rating.toString(),
                  ),
                  const SizedBox(height: 16.0),
                  // RaisedButton(
                  //   onPressed: () {
                  //     // Handle ticket booking functionality
                  //   },
                  //   color: Colors.blue,
                  //   textColor: Colors.white,
                  //   child: Text('Book Tickets'),
                  // ),
                  ElevatedButton(
              child: const Text('Book Tickets'),
              onPressed: () {
                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               BookingScreen()));

              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              textStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold)),
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


