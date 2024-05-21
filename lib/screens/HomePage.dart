// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:test_app/screens/ChatPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
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
      "sent": false
    },
    {
      "name": "Lakshman",
      "Message": "Bhrata, mujhe aadesh dein, sabko mai akele maar dunga!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Bharat",
      "Message": "Kila fateh karke aaiye! Rajya aapka intezar kar raha hai!",
      "time": "11:15",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": true,
      "sent": true
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": true,
      "sent": true
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": false,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": false,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": false,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": false,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": false,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": false,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": false,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": false,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "All the best!",
      "time": "11:20",
      "readStatus": false,
      "sent": false
    },
  ];
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("What's UP"),
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
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(chats[index]["name"]),
                      subtitle: chats[index]["sent"]
                          ? Row(
                              children: [
                                const Icon(Icons.done_all),
                                Text(
                                  chats[index]["Message"],
                                  style: const TextStyle(
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            )
                          : Text(
                              chats[index]["Message"],
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            ),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: index % 2 == 0
                            ? Image.asset("assets/srk.png")
                            : Image.asset("assets/srk1.png"),
                      ),
                      trailing: Text(chats[index]["time"]),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChatPage(
                          name: chats[index]["name"],
                          image: index % 2 == 0
                              ? "assets/srk.png"
                              : "assets/srk1.png",
                        );
                      })),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text("Go to Top"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text("Go to Bottom"),
                ),
              ],
            ),
          ],
        ));
  }
}
