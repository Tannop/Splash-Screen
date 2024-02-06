import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logintestt/terms_of_service_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final void Function(String) onSelectLanguage;

  LanguageSelectionScreen({required this.onSelectLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Intl.message(
                'Select Your Language',
                name: 'selectYourLanguage',
              ),
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(160, 50, 50, 128),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onPressed: () {
                _changeLanguage(context, ('en, US') as String);
              },
              child: const Text('English',
                  style: TextStyle(
                    color: Colors.white,
                    // decoration: TextDecoration.underline,
                  )),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(160, 50, 50, 128),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onPressed: () {
                _changeLanguage(context, ('th, TH') as String);
              },
              child: const Text('ไทย',
                  style: TextStyle(
                    color: Colors.white,
                    // decoration: TextDecoration.underline,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  void _changeLanguage(BuildContext context, String locale) {
    print("Local language =" + locale.toString());
    onSelectLanguage(locale);

    // TermsOfServiceScreen
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            color: Colors.white, // Adjust the color as needed
          ),
          child: TermsOfServiceScreen(selectedLocale: locale),
        );
      },
    );
  }
}
