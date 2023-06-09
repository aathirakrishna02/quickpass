import 'package:flutter/material.dart';

class NotificationSettingScreen extends StatefulWidget {
  @override
  _NotificationSettingScreenState createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool _isNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Manage your notification preferences',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              value: _isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  _isNotificationEnabled = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            ListTile(
              title: const Text('Notification Sound'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle notification sound settings
              },
            ),
           
            
          ],
        ),
      ),
    );
  }
}

