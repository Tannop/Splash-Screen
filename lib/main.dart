import 'package:flutter/material.dart';
import 'package:logintestt/Language_Selection_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LanguageSelectionScreen(
        onSelectLanguage: (Locale) {},
      ),
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('th', 'TH'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // If the locale of the device is not supported, use the first supported locale.
        if (locale != null && supportedLocales.contains(locale)) {
          return locale;
        } else {
          return supportedLocales.first;
        }
      },
    );
  }
}
