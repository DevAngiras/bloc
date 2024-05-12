import 'package:flutter/material.dart';
import 'package:test_app/screens/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'whatsApp',
      theme: ThemeData(

	      popupMenuTheme:PopupMenuThemeData(color:Color(0xFFE1F2E6)),

        primaryColor: Color(0xFF1b9478),
        textTheme: TextTheme(
            headline1: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 24, color: Colors.white),
            headline2: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black),
            subtitle1: TextStyle(fontSize: 16),
            subtitle2: TextStyle(fontSize: 12, color: Colors.black26)),
        iconTheme: IconThemeData(color: Colors.white, size: 20, opacity: 8.0),
        backgroundColor: Color(0xFFE1F2E6),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
