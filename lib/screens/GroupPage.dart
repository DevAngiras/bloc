import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INFO BVCA', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Handle back button press
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.announcement, color: Colors.teal),
              title:
                  Text('Announcements', style: TextStyle(color: Colors.white)),
              subtitle: Text('Mona: Submit your assignment',
                  style: TextStyle(color: Colors.grey)),
              trailing: Text('11:29 AM', style: TextStyle(color: Colors.grey)),
              onTap: () {
                // Handle Announcements tap
              },
            ),
            Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Groups you\'re in',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                child: Icon(Icons.group, color: Colors.white),
              ),
              title: Text('B.Voc C.A (UNITED 🧑‍💻🏴‍☠️)',
                  style: TextStyle(color: Colors.white)),
              subtitle: Text('CR: All classes are cancel',
                  style: TextStyle(color: Colors.grey)),
              trailing: Text('4:05 PM', style: TextStyle(color: Colors.grey)),
              onTap: () {
                // Handle Group tap
              },
            ),
            Divider(color: Colors.grey),
            Spacer(),
            Center(
              child: Text(
                  'Other groups added to the community will appear here.\nCommunity members can join these groups.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey)),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle Add group button press
                  },
                  child: Text('Add group'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
