// import 'package:flutter/material.dart';

// class PromotionsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Promotions and Offers'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16.0),
//         children: [
//           _buildPromotionItem(
//             image: 'assets/images/promotion1.jpg',
//             title: 'Summer Discount',
//             description: 'Get 20% off on all tickets during the summer season.',
//           ),
//           SizedBox(height: 16.0),
//           _buildPromotionItem(
//             image: 'assets/images/promotion2.jpg',
//             title: 'Group Discount',
//             description: 'Bring a group of 5 or more people and get 15% off on each ticket.',
//           ),
//           SizedBox(height: 16.0),
//           _buildPromotionItem(
//             image: 'assets/images/promotion3.jpg',
//             title: 'Weekend Special',
//             description: 'Enjoy a special discounted rate on weekends.',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPromotionItem({required String image, required String title, required String description}) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Colors.grey[200],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
//             child: Image.asset(
//               image,
//               height: 200.0,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   description,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


