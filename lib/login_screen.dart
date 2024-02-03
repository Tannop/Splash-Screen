import 'package:flutter/material.dart';
import 'package:logintestt/Language_Selection_Screen.dart';
import 'package:logintestt/otp_screen.dart';
import 'package:logintestt/otp_send_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Checkbox(
                  value: rememberMe,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value ?? false;
                    });
                  },
                ),
                const Text('Remember Me'),
                const Spacer(), // move forgot password to the right
                GestureDetector(
                  onTap: () {
                    // Handle "Forgot Password" logic
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        // color: Colors.blue,
                        // decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      //builder: (context) => LanguageSelectionScreen()),
                      builder: (context) => OTPSendScreen()),
                );
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Handle "Create New Account" logic
              },
              child: const Text(
                'Create New Account',
                style: TextStyle(
                    // color: Colors.blue,
                    // decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
