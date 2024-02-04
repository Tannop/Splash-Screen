import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class TouchIDScreen extends StatefulWidget {
  @override
  _TouchIDScreenState createState() => _TouchIDScreenState();
}

class _TouchIDScreenState extends State<TouchIDScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _isAuthenticated = false;

  @override
  void initState() {
    super.initState();
    _authenticate();
  }

  Future<void> _authenticate() async {
    try {
      bool isAuthenticated = await _localAuthentication.authenticate(
        localizedReason:
            'Authenticate to access the app', // Reason for authentication
        // useErrorDialogs: true,
        // stickyAuth: true,
      );

      if (isAuthenticated) {
        // Authentication successful, you can navigate to the next screen or perform actions
        setState(() {
          _isAuthenticated = true;
        });
      } else {
        // Authentication failed
        // Handle accordingly, e.g., show an error message
        print('Authentication failed');
      }
    } on PlatformException catch (e) {
      // Handle exceptions
      print('Error during authentication: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Touch ID Authentication'),
          ),
      body: Center(
        child: _isAuthenticated
            ? Text('Authentication Successful!\nYou can now proceed.')
            : CircularProgressIndicator(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TouchIDScreen(),
  ));
}
