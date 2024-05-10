// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.name, required this.image});
  final String name ,image;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              widget.image,
              height: 40,
              width: 40,
            ),
          ),
          title: Text(widget.name),
        )
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  widget.image,
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.name,
              style: TextStyle(fontSize: 30,),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("+91 92649 59384",
              style: TextStyle(fontSize: 30,),),
            ],
          ),
        ],
      ),
    );
  }
}
