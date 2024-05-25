import 'package:flutter/material.dart';
import 'package:test_app/screens/ChatPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      "name": "Shatrughna",
      "Message": "ALl the best bhrata shree!",
      "time": "11:12",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Hanuman",
      "Message": "Jai Shree Ram. On your command, my lord!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Sita",
      "Message": "I am waiting, Come soon!",
      "time": "11:11",
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
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  )
                : Text(
                    chats[index]["Message"],
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: index % 2 == 0
                  ? Image.asset("assets/srk.png")
                  : Image.asset("assets/srk1.png"),
            ),
            trailing: Text(chats[index]["time"]),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ChatPage(
                name: chats[index]["name"],
                image: index % 2 == 0 ? "assets/srk.png" : "assets/srk1.png",
              );
            })),
          );
        });
  }
}
