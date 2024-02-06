// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:logintestt/touch_id_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinScreenconfirm extends StatefulWidget {
  const PinScreenconfirm({super.key});

  @override
  _SetPinScreenState createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<PinScreenconfirm> {
  String currentText = "";
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Confirm PIN'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              'Confirm PIN CODE',
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
                    MaterialPageRoute(builder: (context) => TouchIDScreen()),
                  );
                }
              },
              keyboardAppearance: Theme.of(context).brightness,
              enablePinAutofill: false,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
