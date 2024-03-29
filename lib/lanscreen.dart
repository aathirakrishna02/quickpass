import 'package:flutter/material.dart';

class LanguageSettingScreen extends StatelessWidget {
  final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
  ];

  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your preferred language',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: languages.length,
              itemBuilder: (context, index) {
                String language = languages[index];
                return ListTile(
                  title: Text(language),
                  trailing: selectedLanguage == language
                      ? const Icon(Icons.check)
                      : null,
                  onTap: () {
                    // Handle language selection
                    selectedLanguage = language;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


