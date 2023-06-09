import 'package:flutter/material.dart';
import 'package:quickpass/changepass.dart';
import 'package:quickpass/lanscreen.dart';
import 'package:quickpass/notifiscreen.dart';
import 'package:quickpass/profilescreen.dart';

import 'logoutscreen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'General',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: const Icon(Icons.language),
              title: Text('Language'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle language settings
                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              LanguageSettingScreen()));

              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle notification settings
                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotificationSettingScreen()));
              },
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Account',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.person),
              title: const Text('Profile'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle profile settings
                Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileScreen()));
              },
            ),
            Divider(),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle change password settings
                 Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePasswordScreen()));
              },
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
               //handle logout functionality
               Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               LogoutScreen()));
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

