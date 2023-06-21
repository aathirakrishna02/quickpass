import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

int autoid=1783;
class InvoiceScreen extends StatefulWidget {
  
   String monumentName;
   String date;
   String time;
   int numbertickets;

  InvoiceScreen({
    required this.date,
    required this.monumentName,
    required this.time,
    required this.numbertickets
    
  
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
              'Ticket ID: ${(autoid+13)}',
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
              'Number of tickets: ${widget.numbertickets}',
              style: TextStyle(fontSize: 18.0),
            ),
            
          ],
        ),
      ),
    );
  }
}


