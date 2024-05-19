// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.name, required this.image});
  final String name, image;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool showSearchbox = true;
  RegExp regex = RegExp("");
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  bool attachmentBoxShow = false;
  void _showAttachmentBox() {
    setState(() {
      attachmentBoxShow = !attachmentBoxShow; //
    });
  }

  TextEditingController _textEditingController = TextEditingController();
  List<Map> messages = [
    {
      "message": "Hola!",
      "sent": false,
    },
    {
      "message": "Nevermind!",
      "sent": false,
    },
    {
      "message": "Hello!",
      "sent": true,
    },
    {
      "message": "Hi!",
      "sent": false,
    },
    {
      "message": "How are you?",
      "sent": true,
    },
    {
      "message": "All good! What about you?",
      "sent": false,
    },
    {
      "message": "Same here!",
      "sent": true,
    },
    {
      "message": "Had lunch?",
      "sent": false,
    },
    {
      "message": "Yes! What about you?",
      "sent": true,
    },
    {
      "message": "Not yet, Please order me a pizza",
      "sent": false,
    },
    {
      "message": "Hahaha, Sure!",
      "sent": true,
    },
    {
      "message": "From where do you want to eat?",
      "sent": true,
    },
    {
      "message": "Dominos would be good!",
      "sent": false,
    },
    {
      "message": "Okay!",
      "sent": true,
    },
    {
      "message": "Which one?",
      "sent": true,
    },
    {
      "message": "Golden corn with cheese burst would be great!",
      "sent": false,
    },
    {
      "message": "Sure!",
      "sent": true,
    },
    {
      "message": "I am ordering a Large Golden corn cheese burst",
      "sent": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: false,
        title: showSearchbox
            ? ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(widget.image),
                ),
                title: Text(widget.name),
                subtitle: const Text("Online"),
                trailing: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.video_call),
                      Icon(Icons.call),
                      PopupMenuButton<String>(
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                                PopupMenuItem(
                                  value: "View Contacts",
                                  child: Text("View Contacts"),
                                ),
                                PopupMenuItem(
                                  value: "Media Links Docs",
                                  child: Text("Media Links Docs"),
                                ),
                                PopupMenuItem(
                                  value: "Search",
                                  child: Text("Search"),
                                  onTap: () {
                                    setState(() {
                                      showSearchbox = !showSearchbox;
                                      FocusScope.of(context).unfocus();
                                    });
                                  },
                                ),
                                PopupMenuItem(
                                  value: "Mute Notification",
                                  child: Text("Mute Notification"),
                                ),
                                PopupMenuItem(
                                  value: "Disappearing message",
                                  child: Text("Disappearing message"),
                                ),
                                PopupMenuItem(
                                  value: "Wallpaper",
                                  child: Text("Wallpaper"),
                                ),
                                PopupMenuItem(
                                  value: "more >",
                                  child: Text("more >"),
                                ),
                              ])
                    ],
                  ),
                ),
              )
            : TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        regex =
                            RegExp(searchController.text, caseSensitive: false);
                        if (searchController.text.isEmpty ||
                            searchController.text == " ") {
                          showSearchbox = !showSearchbox;
                          FocusScope.of(context).unfocus();
                        } else {
                          for (var message in messages) {
                            if (regex.hasMatch(message["message"])) {}
                          }
                        }
                        showSearchbox = !showSearchbox;
                        FocusScope.of(context).unfocus();
                      });
                    },
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onTapOutside: (event) => {
                  setState(() {
                    showSearchbox = !showSearchbox;
                    print(showSearchbox);
                    FocusScope.of(context).unfocus();
                  }),
                },
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              attachmentBoxShow = false;
              FocusScope.of(context).unfocus();
            });
          },
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      int previous = index - 1 >= 0 ? index - 1 : 0;
                      int current = index;
                      return Padding(
                        padding: messages[previous]["sent"] ==
                                messages[current]["sent"]
                            ? const EdgeInsets.only(left: 8, right: 8, top: 4)
                            : const EdgeInsets.only(left: 8, right: 8, top: 8),
                        child: Align(
                          alignment: messages[index]["sent"]
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: messages[index]["sent"]
                                  ? Colors.amber[200]
                                  : Colors.blue[200],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.8,
                                ),
                                child: Text(
                                  messages[index]["message"],
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.attachment_sharp),
                          onPressed: _showAttachmentBox,
                        ),
                        hintText: "Type a message",
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        if (_textEditingController.text.isNotEmpty) {
                          setState(() {
                            messages.add({
                              "message": _textEditingController.text,
                              "sent": true,
                            });
                            _textEditingController.clear();
                          });
                        }
                      },
                      child: const Icon(Icons.send)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mic,
                        color: Color.fromARGB(255, 144, 70, 205),
                      ))
                ],
              ),
              attachmentBoxShow
                  ? Container(
                      padding: EdgeInsets.only(top: 25),
                      height: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 37, 37, 37),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Icon(
                                    Icons.photo,
                                    color: Color.fromARGB(255, 66, 108, 117),
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  child: Icon(
                                    Icons.camera,
                                    color: Color.fromARGB(255, 66, 108, 117),
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      Icons.location_pin,
                                      color: Color.fromARGB(255, 66, 108, 117),
                                      size: 30,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  child: Icon(
                                    Icons.contact_phone,
                                    color: Color.fromARGB(255, 66, 108, 117),
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  child: Icon(
                                    Icons.document_scanner,
                                    color: Color.fromARGB(255, 66, 108, 117),
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  child: Icon(
                                    Icons.audio_file,
                                    color: Color.fromARGB(255, 66, 108, 117),
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  child: Icon(
                                    Icons.poll,
                                    color: Color.fromARGB(255, 66, 108, 117),
                                    size: 30,
                                  ),
                                ),
                                SizedBox(
                                  child: Icon(
                                    Icons.payment,
                                    color: Color.fromARGB(255, 66, 108, 117),
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
