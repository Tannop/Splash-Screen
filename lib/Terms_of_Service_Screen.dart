import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logintestt/login_screen.dart';

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
              'Terms', // terms of service
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
                          _moveToLoginScreen(context);
                        }
                      : null,
                  child: Text('Continue'),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    _showDeclineConfirmationDialog(context);
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

  void _moveToLoginScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  Future<void> _showDeclineConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Decline'),
          content:
              Text('Are you sure you want to decline the Terms of Service?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _declineAndExit();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Exit'),
            ),
          ],
        );
      },
    );
  }

  void _declineAndExit() {
    // Optionally show an alert or confirmation dialog before exiting
    exit(0);
  }
}
