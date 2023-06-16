import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickpass/editprofile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final storage = FirebaseFirestore.instance;
  String email = "";
  String name = "";
  String phone = "";
  String image = "";

  @override
   void initState() {
    // TODO: implement initState
    super.initState();
    getname();
    getdata();
  }

  getdata() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      image = (snap.data() as Map<String, dynamic>)['imageLink'];
    });
  }

  getname() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      email = (snap.data() as Map<String, dynamic>)['email'];
      name = (snap.data() as Map<String, dynamic>)['name'];
      phone = (snap.data() as Map<String, dynamic>)['phone'];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
            ),
            const SizedBox(height: 16.0),
            const Text(
            'Name',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Email',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Phone Number',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Text(
              phone,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
           ElevatedButton(
              child: const Text('EDIT PROFILE'),
              onPressed: () {
                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               EditProfileScreen()));


              },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold)),
              ),
          ],
        ),
      ),
    );
  }
}


