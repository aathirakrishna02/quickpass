import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewMonumentBookingScreen extends StatefulWidget {


  @override
  State<ViewMonumentBookingScreen> createState() => _ViewMonumentBookingScreenState();
}

class _ViewMonumentBookingScreenState extends State<ViewMonumentBookingScreen> {

  confirmbooking(String id1, String id2) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('monument')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking-data')
        .where('user-id', isEqualTo: id1)
        .get();
    String id = querySnapshot.docs[0].id;
    await FirebaseFirestore.instance
        .collection('monument')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking-data')
        .doc(id)
        .update({'status':'accepted'});
    setState(() {});
    QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance
        .collection('users')
        .doc(id1)
        .collection('booking-data')
        .where('monument-id', isEqualTo: id2)
        .get();
      String mid=querySnapshot1.docs[0].id;
      
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id1)
        .collection('booking-data')
        .doc(mid)
        .update({'status':'accepted'});

  }
  cancelbooking(String id1,String id2)async
  {
    print(id1);
    print(id2);
QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('monument')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking-data')
        .where('user-id', isEqualTo: id1)
        .get();
    String id = querySnapshot.docs[0].id;
    await FirebaseFirestore.instance
        .collection('monument')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('booking-data')
        .doc(id)
        .delete();
    setState(() {});
    QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance
        .collection('users')
        .doc(id1)
        .collection('booking-data')
        .where('monument-id', isEqualTo: id2)
        .get();
      String mid=querySnapshot1.docs[0].id;
      
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id1)
        .collection('booking-data')
        .doc(mid)
        .delete();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monument Booking Details'),
      ),
      body: Column(
        
        children: [
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('monument')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('booking-data')
                  .where('status', isEqualTo: 'pending')
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
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      confirmbooking(
                                        (snapshot.data! as dynamic)
                                            .docs[index]['user-id'],
                                        (snapshot.data! as dynamic)
                                            .docs[index]['uid'],
                                        
                                      );
                                     
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue),
                                    child: Text(
                                      'Accept',
                                      
                                    )),
                                ElevatedButton(
                                    onPressed: () {
                                      cancelbooking(
                                        (snapshot.data! as dynamic)
                                            .docs[index]['user-id'],
                                        (snapshot.data! as dynamic)
                                            .docs[index]['uid']
                                        // (snapshot.data! as dynamic)
                                        //     .docs[index]['time'],
                                        
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black),
                                    child: Text(
                                      'Decline',
                                      
                                    ))

                                //     icon: const Icon(Icons.cancel_rounded)),
                              ],
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
    );
  }
}


