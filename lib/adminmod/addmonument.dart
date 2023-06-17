import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickpass/adminmod/ahomescreen.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:quickpass/resource/util.dart';

class AddMonumentScreen extends StatefulWidget {
  @override
  _AddMonumentScreenState createState() => _AddMonumentScreenState();
}

class _AddMonumentScreenState extends State<AddMonumentScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Monument'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: selectImage,
              child: Container(
                width: 200.0,
                height: 200.0,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: _image != null
                    ? Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(_image!), fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                      )
                    : Icon(Icons.add_a_photo, size: 60.0, color: Colors.grey[600]),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Enter Monument Details',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            // RaisedButton(
            //   onPressed: () {
            //     // Handle add monument functionality
            //     String name = _nameController.text;
            //     String description = _descriptionController.text;
            //     String location = _locationController.text;

            //     // Perform add monument actions
            //   },
            //   color: Colors.blue,
            //   textColor: Colors.white,
            //   child: Text('Add Monument'),
            // ),
             ElevatedButton(
              child: Text('Add Monument'),
              onPressed: () {
          FirebaseFirestore.instance
              .collection('monument')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .set(
            {
              "name": _nameController.text.trim(),
              "description": _descriptionController.text.trim(),
              "location": _locationController.text.trim(),
            },
          );
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AdminUserHomeScreen()));
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


