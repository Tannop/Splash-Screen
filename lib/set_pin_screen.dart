import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logintestt/pin_confirm_screen.dart';
// import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SetPinScreen extends StatefulWidget {
  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<SetPinScreen> {
  String currentText = "";
  final TextInputFormatter pininput = FilteringTextInputFormatter.digitsOnly;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('Enter PIN'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinCodeTextField(
              keyboardType: TextInputType.number,
              appContext: context,
              length: 6,

              obscureText: true,
              obscuringCharacter: '*',
              //obscuringWidget: const FlutterLogo(size: 24),
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              validator: (v) {
                if (v!.length < 6) {
                  return "Please enter a valid PIN";
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  currentText = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Validate the entered PIN
                if (currentText.length == 6) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PinScreenconfirm()),
                  );
                  // e.g., Navigate to the next screen
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //     content: Text("Entered PIN: $currentText"),
                  //     duration: Duration(seconds: 2),
                  //   ),
                  // );
                } else {
                  // Show an error message if the PIN is not complete
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please enter a valid 6-digit PIN"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}