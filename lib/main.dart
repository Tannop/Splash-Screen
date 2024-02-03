import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logintestt/Terms_of_Service_Screen.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LanguageSelectionScreen(),
    );
  }
}

class LanguageSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/your_logo.svg', // Replace with your logo image path
              height: 100.0,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Select Your Language',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _changeLanguage(context, const Locale('en', 'US'));
              },
              child: const Text('English'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                _changeLanguage(context, const Locale('th', 'TH'));
              },
              child: const Text('ไทย'),
            ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(BuildContext context, Locale locale) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TermsOfServiceScreen()),
    );
  }
}
