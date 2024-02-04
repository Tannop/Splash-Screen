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
      body: Center(
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
              onPressed: () {
                _changeLanguage(context, ('en, US') as String);
              },
              child: const Text('English'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                _changeLanguage(context, ('th, TH') as String);
              },
              child: const Text('ไทย'),
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
