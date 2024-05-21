import 'package:flutter/material.dart';
import 'package:test_app/screens/HomePage.dart';
import 'package:test_app/screens/LinkedDevicesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      routes: {
        '/linkedDevices': (context) => LinkedDevicesPage(),
      },
    );
  }
}
