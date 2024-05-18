// ignore_for_file: file_names
import 'package:flutter/material.dart';

import 'ChatPage.dart';
class NewGroup extends StatefulWidget {
  const NewGroup({super.key});

  // @override
  @override
  State<NewGroup> createState() => _NewGroupState();
}

class _NewGroupState extends State<NewGroup> {
  List chats = [
    {
      "name": "Ram",
      "Message": "Dharmo sarvopari",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Lakshman",
      "Message": "jai sri Ram!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Bharat",
      "Message": " jai sri Ram!",
      "time": "11:15",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Shatrughna",
      "Message": " jai sri Ram!",
      "time": "11:12",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Hanuman",
      "Message": "Jai Shree Ram!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Sita",
      "Message": "jai sri Ram!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "Raghuvanshi",
      "time": "11:20",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "Raghuvanshi",
      "time": "11:20",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Shatrughna",
      "Message": " jai sri Ram!",
      "time": "11:12",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Hanuman",
      "Message": "Jai Shree Ram!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Sita",
      "Message": "jai sri Ram!",
      "time": "11:11",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "Raghuvanshi",
      "time": "11:20",
      "readStatus": true,
      "sent": false
    },
    {
      "name": "Dashrath",
      "Message": "Raghuvanshi",
      "time": "11:20",
      "readStatus": true,
      "sent": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("New Group"),
                Row(
                    children: [
                      Icon(Icons.search),
                    ])
              ]

          )

      ),
      body:

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Contacts on WhatsApp"),
          ),

          Expanded(child: ListView.builder(
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
                    style: const TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: index % 2 == 0
                        ? Image.asset("assets/srk.png")
                        : Image.asset("assets/srk1.png"),
                  ),
                  trailing: Icon(Icons.add_box_rounded),

                );
              }))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('FAB Pressed')),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}







