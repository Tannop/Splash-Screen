import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinLogin extends StatefulWidget {
  const PinLogin({super.key});

  @override
  _Loginpinscreen createState() => _Loginpinscreen();
}

class _Loginpinscreen extends State<PinLogin> {
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
              'Please Enter your PIN ',
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 20.0),
            PinCodeTextField(
              keyboardType: TextInputType.number,
              appContext: context,
              length: 5,
              obscureText: true,
              blinkWhenObscuring: false,
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
                borderRadius: BorderRadius.circular(30),
                fieldHeight: 60,
                fieldWidth: 60,
                activeFillColor: Color.fromARGB(160, 50, 50, 128),
                // enableActiveFill:
                //     true, // Set to true to keep the active fill color after it's filled
                // activeBoxShadow: [
                //   BoxShadow(
                //     color: Color.fromARGB(
                //         160, 50, 50, 128), // Set the color of the shadow
                //     offset: Offset(0, 2), // Set the offset of the shadow
                //     blurRadius: 5, // Set the blur radius of the shadow
                //     spreadRadius: 0, // Set the spread radius of the shadow
                //   ),
                // ],
                inactiveColor: Colors.grey,
                selectedColor: Color.fromARGB(160, 50, 50, 128),
              ),

              onChanged: (value) {
                setState(() {
                  currentText = value;
                });

                // Check if the entered PIN has reached the desired length
                if (value.length == 5) {
                  // Navigate to the next screen
                  //add next screen
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
