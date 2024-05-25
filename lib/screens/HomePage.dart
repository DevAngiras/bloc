// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test_app/screens/CallPage.dart';
import 'package:test_app/screens/ChatPage.dart';
import 'package:test_app/screens/HomeScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _pageOptions = <Widget>[HomeScreen(), CallPage()];

  void changepage(value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  List menuItems = [
    "New Group",
    "New Broadcast",
    "Linked devices",
    "Starred message",
    "Payment",
    "Settings"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("M Whatsapp"),
            Row(
              children: [
                Icon(Icons.search),
                PopupMenuButton<String>(
                    onSelected: (value) => {print(value)},
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                          PopupMenuItem(
                            value: "New Group",
                            child: Text("New Group"),
                          ),
                          PopupMenuItem(
                            value: "New Broadcast",
                            child: Text("New Broadcast"),
                          ),
                          PopupMenuItem(
                            value: "Linked devices",
                            child: Text("Linked devices"),
                          ),
                          PopupMenuItem(
                            value: "Starred message",
                            child: Text("Starred message"),
                          ),
                          PopupMenuItem(
                            value: "Payment",
                            child: Text("Payment"),
                          ),
                          PopupMenuItem(
                            value: "Settings",
                            child: Text("Settings"),
                          ),
                        ])
              ],
            ),
          ],
        ),
      ),
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: changepage,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble), label: "chat"),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: "call"),
          ]),
    );
  }
}
