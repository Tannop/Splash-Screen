import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logintestt/Terms_of_Service_Screen.dart';
import 'package:logintestt/main.dart';

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Intl.message(
                'Select Your Language',
                name: 'selectYourLanguage',
              ),
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _changeLanguage(context, Locale('en', 'US'));
              },
              child: Text('English'),
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                _changeLanguage(context, Locale('th', 'TH'));
              },
              child: Text('ไทย'),
            ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(BuildContext context, Locale locale) {
    print("Local language =" + locale.toString());
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TermsOfServiceScreen()),
    );
  }
}
