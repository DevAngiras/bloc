import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  bool _showallCalls = true;
  final List<Map> callPeople = [
    {
      'name': 'John',
      "time": "10:42",
      "type": ["All", "none"]
    },
    {
      'name': 'Aehmad',
      "time": "9:42",
      "type": ["All", "missed"]
    },
    {
      'name': 'Rahul',
      "time": "8:42",
      "type": ["All", "missed"]
    },
    {
      'name': 'Anwar',
      "time": "7:42",
      "type": ["All", "none"]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    _showallCalls = true;
                  });
                },
                child: Text("All")),
            TextButton(
                onPressed: () {
                  setState(() {
                    _showallCalls = false;
                  });
                },
                child: Text("Missed call"))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 10),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Calls",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
        ),
        Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: _showallCalls
                ? ListView.builder(
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
                    })
                : ListView.builder(
                    itemCount: callPeople.length,
                    itemBuilder: (context, index) {
                      if (callPeople[index]['type'][1] == 'missed') {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text(callPeople[index]['name']),
                          subtitle: Text(callPeople[index]['time']),
                          trailing: Icon(Icons.call),
                        );
                      } else {
                        return SizedBox(
                          height: 0,
                        );
                      }
                    }))
      ],
    );
  }
}
