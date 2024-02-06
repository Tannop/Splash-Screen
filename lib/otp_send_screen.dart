// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:logintestt/otp_screen.dart';

class OTPSendScreen extends StatefulWidget {
  const OTPSendScreen({super.key});

  @override
  _OTPSendScreenState createState() => _OTPSendScreenState();
}

class _OTPSendScreenState extends State<OTPSendScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Send OTP Confirmation'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your OTP number will be sent to this phone number',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            const Text(
              '082-XXX-8998',
              style: TextStyle(
                  fontSize: 20.0, color: Color.fromARGB(160, 50, 50, 128)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            // TextField(
            //   controller: _phoneNumberController,
            //   keyboardType: TextInputType.phone,
            //   decoration: const InputDecoration(
            //     labelText: 'Phone Number',
            //   ),
            // ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onPressed: () {
                // Add logic to send OTP to the provided phone number
                // For simplicity, let's just print the phone number for now.
                print('Sending OTP to: ${_phoneNumberController.text}');
                // Navigate to the OTP verification screen
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => OTPScreen()));
              },
              child: const Text('Send OTP'),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Incase the phone number isn\'t correct, please contact this phone number 02-XXX-XXXX',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
