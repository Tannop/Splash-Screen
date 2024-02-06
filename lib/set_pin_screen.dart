import 'package:flutter/material.dart';
import 'package:logintestt/pin_confirm_screen.dart';
// import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({super.key});

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<SetPinScreen> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Set PIN CODE',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            PinCodeTextField(
              keyboardType: TextInputType.number,
              appContext: context,
              length: 5,
              obscureText: true,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              // validator: (v) {
              //   if (v!.length < 5) {
              //     return "Please enter a valid PIN";
              //   } else {
              //     return null;
              //   }
              // },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.circle,
                borderRadius: BorderRadius.circular(
                    30), // Adjust the radius to make the circles closer
                fieldHeight: 60, // Adjust the height of the circle
                fieldWidth: 60, // Adjust the width of the circle
                activeFillColor: const Color.fromARGB(160, 50, 50, 128),
                inactiveColor: Colors
                    .grey, // Set the inactive color to make it fill the color inside
                selectedColor: const Color.fromARGB(160, 50, 50, 128),
              ),
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });

                // Check if the entered PIN has reached the desired length
                if (value.length == 5) {
                  // Navigate to the next screen
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PinScreenconfirm()),
                  );
                }
              },
              keyboardAppearance: Theme.of(context).brightness,
              enablePinAutofill: false,
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     // Validate the entered PIN
            //     if (currentText.length == 6) {
            //       Navigator.pushReplacement(
            //         context,
            //         MaterialPageRoute(builder: (context) => PinScreenconfirm()),
            //       );
            //     } else {
            //       // Show an error message if the PIN is not complete
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text("Please enter a valid 6-digit PIN"),
            //           duration: Duration(seconds: 2),
            //         ),
            //       );
            //     }
            //   },
            //   child: Text('Submit'),
            // ),
          ],
        ),
      ),
    );
  }
}
