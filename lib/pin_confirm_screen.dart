import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinScreenconfirm extends StatefulWidget {
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
        title: Text('Confirm PIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinCodeTextField(
              appContext: context,
              length: 6,
              obscureText: true,
              obscuringCharacter: '*',
              // obscuringWidget: const FlutterLogo(size: 24),
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
                  // PIN chheck logic
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PinScreenconfirm()),
                  );
                } else {
                  // Show an error message if the PIN is not complete
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
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
