import 'package:flutter/material.dart';

class InvoiceScreen extends StatefulWidget {
   String ticketId;
   String monumentName;
   String date;
   String time;
   String ticketType;
   String ticketPrice;
   String totalPrice;

  InvoiceScreen({
    required this.ticketId,
    required this.monumentName,
    required this.date,
    required this.time,
    required this.ticketType,
    required this.ticketPrice,
    required this.totalPrice,
  });

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ticket ID: ${widget.ticketId}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Monument: ${widget.monumentName}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Date: ${widget.date}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Time: ${widget.time}',
              style: TextStyle(fontSize: 18.0),
            ),
           
            SizedBox(height: 16.0),
            Text(
              'Ticket Price: \$${widget.ticketPrice}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Price: \$${widget.totalPrice}',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


