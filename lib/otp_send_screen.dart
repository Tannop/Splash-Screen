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
              style: TextStyle(fontSize: 20.0),
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
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  minimumSize: Size(double.infinity, 55),
                  elevation: 4),
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
          ],
        ),
      ),
    );
  }
}
