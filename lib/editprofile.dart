import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickpass/profilescreen.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit your profile',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32.0),
             ElevatedButton(
              onPressed: () {
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update(
            {
              "name": _nameController.text.trim(),
              "email": _emailController.text.trim(),
              "phone": _phoneController.text.trim(),
            },
          );
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              textStyle: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold)),
              child: const Text('Save Profile'),
              ),
            // RaisedButton(
            //   onPressed: () {
            //     // Handle save profile functionality
            //     String name = _nameController.text;
            //     String email = _emailController.text;
            //     String phone = _phoneController.text;

            //     // Update profile with the new data
            //   },
            //   color: Colors.blue,
            //   textColor: Colors.white,
            //   child: Text('Save Profile'),
            // ),
          ],
        ),
      ),
    );
  }
}
