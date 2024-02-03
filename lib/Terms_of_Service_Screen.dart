import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logintestt/login_screen.dart';
import 'package:intl/intl.dart';

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
        title: Text(
          Intl.message('Terms of Service', name: 'termsOfService'),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Intl.message(
                'Terms of Service Agreement',
                name: 'termsOfServiceAgreement',
                desc: 'Title for the terms of service agreement',
              ),
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              Intl.message(
                'Terms', // terms of service
                name: 'termsText',
                desc: 'Placeholder for the actual terms text',
              ),
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
                Text(
                  Intl.message(
                    'I accept the Terms of Service',
                    name: 'acceptTerms',
                    desc: 'Checkbox label',
                  ),
                ),
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
                  child: Text(
                    Intl.message(
                      'Continue',
                      name: 'continueButton',
                      desc: 'Continue button label',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    _showDeclineConfirmationDialog(context);
                  },
                  child: Text(
                    Intl.message(
                      'Decline',
                      name: 'declineButton',
                      desc: 'Decline button label',
                    ),
                  ),
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
          title: Text(
            Intl.message(
              'Confirm Decline',
              name: 'confirmDecline',
              desc: 'Confirmation dialog title',
            ),
          ),
          content: Text(
            Intl.message(
              'Are you sure you want to decline the Terms of Service?',
              name: 'confirmDeclineText',
              desc: 'Confirmation dialog content',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                Intl.message(
                  'Cancel',
                  name: 'cancelButton',
                  desc: 'Cancel button label',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _declineAndExit();
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text(
                Intl.message(
                  'Exit',
                  name: 'exitButton',
                  desc: 'Exit button label',
                ),
              ),
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
