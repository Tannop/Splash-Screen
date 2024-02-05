import 'package:flutter/material.dart';
import 'package:logintestt/password_reset_confirmation_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Forgot Password'),
          ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Forgot your password?',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            const SizedBox(height: 20.0),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Enter your email address or phone number to reset your password.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 140.0),
            Align(
              alignment: Alignment.center,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email / phone number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
              ),
              onPressed: () {
                // logic for send password reset email
                _showResetConfirmationDialog(context);
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showResetConfirmationDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return PasswordResetConfirmationScreen();
      },
    );
  }
}
