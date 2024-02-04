import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class SetPinScreen extends StatefulWidget {
  @override
  _SetPinScreenState createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  final TextEditingController _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set PIN Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter a 4-digit PIN code for security.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            PinInputTextField(
              controller: _pinController,
              pinLength: 4,
              decoration: UnderlineDecoration(
                colorBuilder: PinListenColorBuilder(
                    Colors.transparent, Colors.transparent),
              ),
              autoFocus: true,
              textInputAction: TextInputAction.done,
              onSubmit: (pin) {
                // Handle PIN submission logic
                print('Entered PIN: $pin');
                // You can save the PIN and navigate to the next screen or perform other actions.
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Validate PIN length and perform additional logic if needed
                if (_pinController.text.length == 4) {
                  // Save the PIN and navigate to the next screen or perform other actions.
                  print('Set PIN: ${_pinController.text}');
                  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextScreen()));
                } else {
                  // Handle validation error
                  // You can display an error message or take other actions.
                  print('PIN must be 4 digits');
                }
              },
              child: Text('Set PIN'),
            ),
          ],
        ),
      ),
    );
  }
}
