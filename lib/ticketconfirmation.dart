import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

int autoid=1783;
class InvoiceScreen extends StatefulWidget {
  
  

  InvoiceScreen({
   super.key
    
  
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
          
          children: [
            Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
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
          )
            
          ],
        ),
      ),
    );
  }
}


