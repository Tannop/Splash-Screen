import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

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
            SizedBox(height: 16.0),
            Text(
              'Select Your Language',
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
    // You can implement language change logic here if needed
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TermsOfServiceScreen()),
    );
  }
}

class TermsOfServiceScreen extends StatefulWidget {
  @override
  _TermsOfServiceScreenState createState() => _TermsOfServiceScreenState();
}

class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
  bool _acceptedTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Service'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms of Service Agreement',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...', // Add your terms of service text
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Checkbox(
                  value: _acceptedTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptedTerms = value ?? false;
                    });
                  },
                ),
                Text('I accept the Terms of Service'),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _acceptedTerms
                      ? () {
                          _moveToSplashScreen(context);
                        }
                      : null,
                  child: Text('Continue'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    _declineAndExit();
                  },
                  child: Text('Decline'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _moveToSplashScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }

  void _declineAndExit() {
    // Optionally show an alert or confirmation dialog before exiting
    exit(0);
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long-running task (e.g., loading data, checking authentication)
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

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
            SizedBox(height: 16.0),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Text('Your login screen content goes here.'),
      ),
    );
  }
}
