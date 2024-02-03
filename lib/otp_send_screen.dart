import 'package:flutter/material.dart';
import 'package:logintestt/otp_screen.dart';

class OTPSendScreen extends StatefulWidget {
  @override
  _OTPSendScreenState createState() => _OTPSendScreenState();
}

class _OTPSendScreenState extends State<OTPSendScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send OTP Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your phone number to receive the OTP.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to send OTP to the provided phone number
                // For simplicity, let's just print the phone number for now.
                print('Sending OTP to: ${_phoneNumberController.text}');
                // Navigate to the OTP verification screen
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => OTPScreen()));
              },
              child: Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
