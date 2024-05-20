import 'package:flutter/material.dart';

import 'ChatPage.dart';
import 'NewContact.dart';
class Contact extends StatefulWidget {
  const Contact({super.key});

  // @override
  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(" New Contact"),
            ])

      ),
    body:Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'enter name',
              prefixIcon:Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
        onChanged: (String value){
    },

            ),
      TextFormField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          labelText: 'Phone Number',
          hintText: 'enter phone number',
          prefixIcon:Icon(Icons.phone),
          border: OutlineInputBorder(),
        ),
        onChanged: (String value){
        },

      ),
          SizedBox(height:30),
          MaterialButton(
            minWidth: double.infinity ,
            onPressed: () {},
            child: Text('SAVE'),
            color: Colors.teal,
            textColor: Colors.white,
            )

        ],
      ),
    ),

    );
  }
}

