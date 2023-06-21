import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking History'),
      ),
      body: SafeArea(child: Column(children: [Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('monument')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('booking-data')
                  .where('status', isEqualTo: 'accepted')
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.separated(
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.white,
                        ),
                        // height: 150,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.person_rounded,
                                  size: 40,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text('Number of tickets :'+
                                  (snapshot.data! as dynamic).docs[index]
                                      ['number'].toString(),
                                  
                                ),
                              ],
                            ),
                            const SizedBox(height: 7),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Date:',
                                         
                                        ),
                                        Text(
                                          (snapshot.data! as dynamic)
                                              .docs[index]['date'],
                                          
                                        ),
                                      ]),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Time',
                                       
                                      ),
                                      Text(
                                        (snapshot.data! as dynamic)
                                            .docs[index]['time'],
                                      
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 20,
                              thickness: 0.7,
                              color: Colors.grey,
                            ),
                            // Row(
                            //   mainAxisAlignment:
                            //       MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Padding(
                            //       padding: const EdgeInsets.only(left: 10.0),
                            //       child: Column(
                            //           crossAxisAlignment:
                            //               CrossAxisAlignment.start,
                            //           children: [
                            //             Text(
                            //               'Booking Date:',
                                          
                            //             ),
                            //             Text(
                            //               (snapshot.data! as dynamic)
                            //                   .docs[index]['booked-date'],
                                         
                            //             ),
                            //           ]),
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsets.only(right: 8.0),
                            //       child: Column(
                            //         children: [
                            //           Text(
                            //             'Booking Time:',
                                        
                            //           ),
                            //           Text(
                            //             (snapshot.data! as dynamic)
                            //                 .docs[index]['time'],
                                        
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 12,
                            ),
                            
                            // Visibility(
                            //   //visible: !visibility,
                            //   child: ElevatedButton(
                            //       onPressed: () {
                            //         completebooking(
                            //           (snapshot.data! as dynamic).docs[index]
                            //               ['user-name'],
                            //           (snapshot.data! as dynamic).docs[index]
                            //               ['servicetype'],
                            //           (snapshot.data! as dynamic).docs[index]
                            //               ['booked-date'],
                            //           (snapshot.data! as dynamic).docs[index]
                            //               ['time'],
                            //         );
                            //       },
                            //       style: ElevatedButton.styleFrom(
                            //           backgroundColor:
                            //               Color.fromARGB(255, 21, 112, 249)),
                            //       child: Text(
                            //         'Completed',
                            //         style: GoogleFonts.raleway(
                            //             fontWeight: FontWeight.bold,
                            //             color: Colors.white),
                            //       )),
                            // ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ));
              },
            ),
          )],))
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

