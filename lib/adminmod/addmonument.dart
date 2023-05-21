import 'package:flutter/material.dart';

class AddMonumentScreen extends StatefulWidget {
  @override
  _AddMonumentScreenState createState() => _AddMonumentScreenState();
}

class _AddMonumentScreenState extends State<AddMonumentScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

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
              child: const Text('Add Monument'),
              onPressed: () {
                    // Handle add monument functionality
                String name = _nameController.text;
                String description = _descriptionController.text;
                String location = _locationController.text;

                // Perform add monument actions

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


