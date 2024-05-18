// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.name, required this.image});
  final String name, image;

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
          child: Image(image: AssetImage(widget.image)),
        ),
        title: Text(widget.name),
        trailing: PopupMenuButton(
          elevation: 10,
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 1,
              child: Text(
                "Share",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const PopupMenuItem(
              value: 1,
              child: Text(
                "Edit",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const PopupMenuItem(
              value: 1,
              child: Text(
                "View in address book",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const PopupMenuItem(
              value: 1,
              child: Text(
                "Verify security code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Image(
                    image: AssetImage(widget.image),
                    height: 160,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "+91 12345 67890",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 90.0, // Adjust width and height as needed
                  height: 95.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0,
                        top: 10,
                        right: 6,
                        bottom: 7), // Adjust padding values
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0, // Adjust border width
                        ),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: Icon(
                              Icons.call_outlined,
                              size: 25,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "Audio",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 90.0, // Adjust width and height as needed
                  height: 95.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 6.0,
                        top: 10,
                        right: 6,
                        bottom: 7), // Adjust padding values
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0, // Adjust border width
                        ),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            // width:50,
                            height: 40,
                            child: Icon(
                              Icons.videocam_outlined,
                              size: 25,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "Video",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 90.0, // Adjust width and height as needed
                  height: 95.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 6.0,
                        top: 10,
                        right: 6,
                        bottom: 7), // Adjust padding values
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0, // Adjust border width
                        ),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            // width:50,
                            height: 40,
                            child: Icon(
                              Icons.currency_rupee_rounded,
                              size: 25,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "Pay",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 90.0, // Adjust width and height as needed
                  height: 95.0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 6,
                        top: 10,
                        right: 10,
                        bottom: 7), // Adjust padding values
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0, // Adjust border width
                        ),
                      ),
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 40,
                            child: Icon(
                              Icons.search_outlined,
                              size: 25,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "Search",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.grey,
              ),
            ),
            Container(
              height: 60,
              child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "  Hey there! I am using WhatsApp.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.grey,
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "  Media, links, and docs",
                    style: TextStyle(fontSize: 15),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/srk.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/srk.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/srk1.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/srk.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/srk1.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/srk.png",
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.grey,
              ),
            ),
            Container(
              child: const Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(11),
                        child: Icon(
                          Icons.notifications_outlined,
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 5, right: 10, bottom: 5),
                        child: Text(
                          "Notifications",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(11),
                        child: Icon(
                          Icons.photo_outlined,
                          size: 23,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 5, right: 10, bottom: 5),
                        child: Text(
                          "Media visibility",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.grey,
              ),
            ),
            Container(
              child: const Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(11),
                        child: Icon(
                          Icons.lock_outline,
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 5, right: 10, bottom: 5),
                        child: Text(
                          "Ecryption",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(11),
                        child: Icon(
                          Icons.av_timer_outlined,
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 5, right: 10, bottom: 5),
                        child: Text(
                          "Disappearing messages",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(11),
                        child: Icon(
                          Icons.photo_outlined,
                          size: 25,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 10, top: 5, right: 10, bottom: 5),
                        child: Text(
                          "Chat lock",
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.grey,
              ),
            ),
            Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(11),
                        child: Icon(
                          Icons.block,
                          size: 24,
                          color: Colors.red,
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Block",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(11),
                        child: Icon(
                          Icons.thumb_down_outlined,
                          size: 25,
                          color: Colors.red,
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Report",
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
