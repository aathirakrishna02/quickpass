// import 'package:flutter/material.dart';
// import 'package:quickpass/ticketconfirmation.dart';

// class PaymentScreen extends StatefulWidget {
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   String selectedPaymentMethod = '';

//   void selectPaymentMethod(String paymentMethod) {
//     setState(() {
//       selectedPaymentMethod = paymentMethod;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Payment'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Payment Method',
//               style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16.0),
//             const Text(
//               'Select a payment method:',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             const SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: () => selectPaymentMethod('Credit Card'),
//               child: PaymentMethodTile(
//                 icon: Icons.credit_card,
//                 title: 'Credit Card',
//                 isSelected: selectedPaymentMethod == 'Credit Card',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: () => selectPaymentMethod('UPI'),
//               child: PaymentMethodTile(
//                 icon: Icons.credit_card,
//                 title: 'UPI',
//                 isSelected: selectedPaymentMethod == 'UPI',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: () => selectPaymentMethod('PayPal'),
//               child: PaymentMethodTile(
//                 icon: Icons.payment,
//                 title: 'PayPal',
//                 isSelected: selectedPaymentMethod == 'PayPal',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             GestureDetector(
//               onTap: () => selectPaymentMethod('Gift Card'),
//               child: PaymentMethodTile(
//                 icon: Icons.wallet_giftcard,
//                 title: 'Gift Card',
//                 isSelected: selectedPaymentMethod == 'Gift Card',
//               ),
//             ),
//             const SizedBox(height: 32.0),
//             ElevatedButton(
//               child: Text('Pay Now'),
//               onPressed: () {
//               //    Navigator.push(
//               //                         context,
//               //                         MaterialPageRoute(
//               //                             builder: (context) =>
//               //                                 InvoiceScreen(ticketId: '', monumentName: '', date: '', time: '', ticketType: '', ticketPrice: '', totalPrice: '')));
//               // },

//               style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.blue,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
//               textStyle: const TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.bold)),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PaymentMethodTile extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final bool isSelected;

//   PaymentMethodTile({
//     required this.icon,
//     required this.title,
//     required this.isSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: isSelected ? Colors.blue : Colors.grey[400]!,
//           width: 1.0,
//         ),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: [
//           Icon(icon),
//           const SizedBox(width: 16.0),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 16.0),
//           ),
//         ],
//       ),
//     );
//   }
// }


