import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final List<Map> callPeople = [
    {
      'name': 'John',
      "time": "10:42",
      "type": ["All", "none"]
    },
    {
      'name': 'John',
      "time": "9:42",
      "type": ["All", "missed"]
    },
    {
      'name': 'John',
      "time": "8:42",
      "type": ["All", "missed"]
    },
    {
      'name': 'John',
      "time": "7:42",
      "type": ["All", "none"]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 10, top: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Calls",
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: callPeople.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(callPeople[index]['name']),
                      subtitle: Text(callPeople[index]['time']),
                      trailing: Icon(Icons.call),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
