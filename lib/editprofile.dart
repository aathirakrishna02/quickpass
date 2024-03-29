import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickpass/profilescreen.dart';
import 'package:quickpass/resource/store.dart';
import 'package:quickpass/resource/util.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Uint8List? _image;
  String image = "";
  
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    getname();
  }

    getname() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      _emailController.text = (snap.data() as Map<String, dynamic>)['email'];
      _nameController.text = (snap.data() as Map<String, dynamic>)['username'];
      _phoneController.text = (snap.data() as Map<String, dynamic>)['phone'];
    });
  }

  void saveprofile() async {
    await Storedata().addImage(file: _image!);
  }

  final storage = FirebaseAuth.instance;

  getdata() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      image = (snap.data() as Map<String, dynamic>)['imageLink'];
    });
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
          children: [
                _image == null
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                      )
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: MemoryImage(_image!),
                      ),
                Positioned(
                    top: 50,
                    left: 65,
                    child: IconButton(
                        onPressed: () async {
                          selectImage();
                        },
                        icon: const Icon(Icons.add_a_photo))),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                saveprofile();
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
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}