import 'package:flutter/material.dart';
import 'package:logintestt/set_pin_screen.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('OTP Verification'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Verify yourself',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            const SizedBox(height: 20.0),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Please enter the OTP sent to this mobile number.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 20.0),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                '082-XXX-8998',
                style: TextStyle(fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 100.0),
            PinInputTextField(
              controller: _otpController,
              pinLength: 6,
              decoration: UnderlineDecoration(
                colorBuilder: PinListenColorBuilder(
                    Colors.transparent, Colors.transparent),
              ),
              autoFocus: true,
              textInputAction: TextInputAction.done,
              onSubmit: (pin) {
                if (_otpController.text.length == 6) {
                  //if else for check OTP logic
                  // After entering the last digit, navigate to the next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SetPinScreen()),
                  );
                }
              },
            ),

            const SizedBox(height: 60.0),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Didn\' recieve the OTP?',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Resend OTP',
                style: TextStyle(
                    fontSize: 16.0, color: Color.fromARGB(160, 50, 50, 128)),
                textAlign: TextAlign.center,
              ),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // logic to verify the OTP
            //     print('Entered OTP: ${_otpController.text}');
            //     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
            //   },
            //   child: Text('Verify OTP'),
            // ),
          ],
        ),
      ),
    );
  }
}
