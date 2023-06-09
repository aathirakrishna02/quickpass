// import 'package:flutter/material.dart';

// class InvoiceScreen extends StatelessWidget {
//    String ticketId;
//    String monumentName;
//    String date;
//    String time;
//    String ticketType;
//    double ticketPrice;
//    double totalPrice;

//   InvoiceScreen({
//     required this.ticketId,
//     required this.monumentName,
//     required this.date,
//     required this.time,
//     required this.ticketType,
//     required this.ticketPrice,
//     required this.totalPrice,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Invoice'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Ticket ID: $ticketId',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Monument: $monumentName',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Date: $date',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Time: $time',
//               style: TextStyle(fontSize: 18.0),
//             ),
           
//             SizedBox(height: 16.0),
//             Text(
//               'Ticket Price: \$${ticketPrice.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 18.0),
//             ),
//             SizedBox(height: 16.0),
//             Text(
//               'Total Price: \$${totalPrice.toStringAsFixed(2)}',
//               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


