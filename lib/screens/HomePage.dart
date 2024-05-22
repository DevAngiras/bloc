// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hello/screens/ChatPage.dart';
import 'package:hello/screens/SettingsPage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showLastSeen = true; // Privacy setting for last seen
  List menuItems = [
    "New Group",
    "New Broadcast",
    "Linked devices",
    "Starred message",
    "Payment",
    "Settings"
  ];
  List chats = [
    {
      "name": "Ram",
      "Message": "I have reached Lanka",
      "time": "11:11",
      "readStatus": true,
      "sent": false,
      "lastSeen": "10:30 AM",
      "isOnline": false
    },
    {
      "name": "Lakshman",
      "Message": "Bhrata, mujhe aadesh dein, sabko mai akele maar dunga!",
      "time": "11:11",
      "readStatus": true,
      "sent": false,
      "lastSeen": "11:00 AM",
      "isOnline": true
    },
    {
      "name": "Bharat",
      "Message": "Kila fateh karke aaiye! Rajya aapka intezar kar raha hai!",
      "time": "11:15",
      "readStatus": true,
      "sent": false,
      "lastSeen": "11:10 AM",
      "isOnline": false
    },
    {
      "name": "Shatrughna",
      "Message": "ALl the best bhrata shree!",
      "time": "11:12",
      "readStatus": true,
      "sent": false,
      "lastSeen": "11:00 AM",
      "isOnline": true
    },
    {
      "name": "Hanuman",
      "Message": "Jai Shree Ram. On your command, my lord!",
      "time": "11:11",
      "readStatus": true,
      "sent": false,
      "lastSeen": "11:10 AM",
      "isOnline": true
    },
    {
      "name": "Sita",
      "Message": "I am waiting, Come soon!",
      "time": "11:11",
      "readStatus": true,
      "sent": false,
      "lastSeen": "11:00 AM",
      "isOnline": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": true,
      "sent": true,
      "lastSeen": "11:15 AM",
      "isOnline": true
    },
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
              Text("What's UP"),
              Row(
                children: [
                  Icon(Icons.search),
                  PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == "Settings") {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              SettingsPage(
                                showLastSeen: showLastSeen,
                                onShowLastSeenChanged: (value) {
                                  setState(() {
                                    showLastSeen = value;
                                  });
                                },
                              ),),);
                        }
                      },
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
                      ]),
                ],
              ),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(chats[index]["name"]),
                subtitle:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (chats[index]["isOnline"])
                      Text("Online", style: TextStyle(color: Colors.green)),
                    if (!chats[index]["isOnline"] && showLastSeen)
                      Text("Last seen at ${chats[index]["lastSeen"]}"),
                    Row(
                      children: [
                        if (chats[index]["sent"]) Icon(Icons.done_all),
                        Expanded(
                          child: Text(
                            chats[index]["Message"],
                            style: TextStyle(overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: index % 2 == 0
                      ? Image.asset("assets/images/img1.png")
                      : Image.asset("assets/images/img1.png"),
                ),
                trailing: Text(chats[index]["time"]),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return ChatPage(
                        name: chats[index]["name"],
                        image:
                        index % 2 == 0 ? "assets/images/img1.png" : "assets/images/img2.png",



                      );
                    })),
              );
            }));
  }
}
