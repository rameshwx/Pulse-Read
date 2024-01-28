import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'controller/pulse_naviation_bar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const PulseReadApp());
  });
}

class PulseReadApp extends StatelessWidget {
  const PulseReadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pulse Read News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // A neutral color for primary swatch
        primaryColor: Color.fromRGBO(8, 109, 160, 1), // Vibrant blue theme color
        scaffoldBackgroundColor: Colors.white, // A light background color
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(7, 34, 57, 1), // Dark navy for app bars
          iconTheme: IconThemeData(color: Colors.white), // Icon theme for app bars
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Color.fromRGBO(8, 109, 160, 1), // Vibrant blue for tab labels
          unselectedLabelColor: Colors.grey, // Color for unselected tab labels
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(color: Colors.black87), // General text styling
        ),
      ),
      home: const PulseNavPage(), // Your customized bottom navigation bar page
    );
  }
}
