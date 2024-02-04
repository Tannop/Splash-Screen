// password_reset_confirmation_screen.dart
import 'package:flutter/material.dart';
import 'package:logintestt/login_screen.dart';

class PasswordResetConfirmationScreen extends StatefulWidget {
  @override
  _PasswordResetConfirmationScreenState createState() =>
      _PasswordResetConfirmationScreenState();
}

class _PasswordResetConfirmationScreenState
    extends State<PasswordResetConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Password Reset Confirmation'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.green,
              radius: 80.0,
              child: Icon(
                Icons.check,
                color: Colors.white,
                size: 80.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Success!',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'You reset your password',
              style: TextStyle(
                fontSize: 18.0,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55),
              ),
              onPressed: () {
                // Navigator.of(context).pop(); // Close the confirmation screen
                // // Optionally, navigate to another screen or perform additional actions
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
