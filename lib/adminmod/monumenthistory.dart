import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking History'),
      ),
      body: ListView.builder(
        itemCount: bookingHistory.length,
        itemBuilder: (BuildContext context, int index) {
          final booking = bookingHistory[index];
          return ListTile(
            title: Text(
              'Booking ID: ${booking.bookingId}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Monument Name: ${booking.monumentName}'),
                SizedBox(height: 8.0),
                Text('Booking Date: ${booking.bookingDate}'),
                SizedBox(height: 8.0),
                Text('Number of Tickets: ${booking.numTickets}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {
                // Handle cancel booking functionality
              },
            ),
          );
        },
      ),
    );
  }
}

class Booking {
  final String bookingId;
  final String monumentName;
  final String bookingDate;
  final int numTickets;

  Booking({
    required this.bookingId,
    required this.monumentName,
    required this.bookingDate,
    required this.numTickets,
  });
}

// Sample booking data
List<Booking> bookingHistory = [
  Booking(
    bookingId: '123456',
    monumentName: 'Monument 1',
    bookingDate: 'May 20, 2023',
    numTickets: 2,
  ),
  Booking(
    bookingId: '789012',
    monumentName: 'Monument 2',
    bookingDate: 'May 25, 2023',
    numTickets: 4,
  ),
  Booking(
    bookingId: '345678',
    monumentName: 'Monument 3',
    bookingDate: 'May 28, 2023',
    numTickets: 1,
  ),
];

