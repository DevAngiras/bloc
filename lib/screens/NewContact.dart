import 'package:flutter/material.dart';

import 'ChatPage.dart';
import 'Contact.dart';
class NewContact extends StatefulWidget {
  const NewContact({super.key});

  // @override
  @override
  State<NewContact> createState() => _NewContactState();
}

class _NewContactState extends State<NewContact> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .inversePrimary,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Select Contact"),
                
                  Row(
                      children: [
                        Icon(Icons.search),
                      ])
                ]

            )

        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return ListTile(
              leading:CircleAvatar(child: Icon(Icons.person_add),
              ),

              title: Text("New Contact",
                  style: TextStyle(fontSize:15,fontWeight: FontWeight.bold)),
              onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) {
              return Contact();
              })),

            );
          },
        )
    );
  }
}



