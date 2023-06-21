import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:quickpass/ticketconfirmation.dart';
import 'paymentscreen.dart';

class BookingScreen extends StatefulWidget {
  final String name;
  BookingScreen({super.key, required this.name});
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int numberOfTickets = 1;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String? date;
  String? time;
  savedetails() async {
    print(numberOfTickets);
    print(selectedDate);
    print(selectedTime);
    print(widget.name);
    date = selectedDate.toString();
    time = selectedTime.toString();
    date = date!.substring(0, 10);
    time = time!.substring(10, 15);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking-data')
        .doc()
        .set({
      'number': numberOfTickets,
      'date': date,
      'time': time,
      'monument-name': widget.name
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Number of Tickets',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (numberOfTickets > 1) {
                        numberOfTickets--;
                      }
                    });
                  },
                ),
                Text(
                  numberOfTickets.toString(),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      numberOfTickets++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Date',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 8.0),
                  Text(
                    selectedDate.toString().split(' ')[0],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Time',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 8.0),
                  Text(
                    selectedTime.format(context),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // RaisedButton(
            //   onPressed: () {
            //     // Handle booking button action

            //   },
            //   child: Text('Book Now'),
            // ),
            ElevatedButton(
              child: const Text('Book Now'),
              onPressed: () {
                savedetails();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InvoiceScreen(
                              date: date!,
                              monumentName: widget.name,
                              time: time!,
                              numbertickets: numberOfTickets,
                            )));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: BookingScreen(),
//   ));
// }
