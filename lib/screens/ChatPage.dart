// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.name, required this.image});
  final String name, image;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  // Updated messages list with isStarred attribute
  List<Map> messages = [
    {
      "message": "Hola!",
      "sent": false,
      "isStarred": false, // Added isStarred attribute
    },
    {
      "message": "Nevermind!",
      "sent": false,
      "isStarred": false,
    },
    {
      "message": "Hello!",
      "sent": true,
      "isStarred": false,
    },
    {
      "message": "Hi!",
      "sent": false,
      "isStarred": false,
    },
    {
      "message": "How are you?",
      "sent": true,
      "isStarred": false,
    },
    {
      "message": "All good! What about you?",
      "sent": false,
      "isStarred": false,
    },
    {
      "message": "Same here!",
      "sent": true,
      "isStarred": false,
    },
    {
      "message": "Had lunch?",
      "sent": false,
      "isStarred": false,
    },
    {
      "message": "Yes! What about you?",
      "sent": true,
      "isStarred": false,
    },
    {
      "message": "Not yet, Please order me a pizza",
      "sent": false,
      "isStarred": false,
    },
    {
      "message": "Hahaha, Sure!",
      "sent": true,
      "isStarred": false,
    },
    {
      "message": "From where do you want to eat?",
      "sent": true,
      "isStarred": false,
    },
    {
      "message": "Dominos would be good!",
      "sent": false,
      "isStarred": false,
    },
    {
      "message": "Okay!",
      "sent": true,
      "isStarred": false,
    },
    {
      "message": "Which one?",
      "sent": true,
      "isStarred": false,
    },
    {
      "message": "Golden corn with cheese burst would be great!",
      "sent": false,
      "isStarred": false,
    },
    {
      "message": "Sure!",
      "sent": true,
      "isStarred": false,
    },
    {
      "message": "I am ordering a Large Golden corn cheese burst",
      "sent": true,
      "isStarred": false,
    },
  ];

  // Method to toggle star status
  void _toggleStarMessage(int index) {
    setState(() {
      messages[index]['isStarred'] = !messages[index]['isStarred'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: false,
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(widget.image),
          ),
          title: Text(widget.name),
          subtitle: const Text("Online"),
          trailing: SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.video_call),
                Icon(Icons.call),
                Icon(Icons.more_vert),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            controller: _scrollController,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              int previous = index - 1 >= 0 ? index - 1 : 0;
              int current = index;
              return GestureDetector(
                onLongPress: () =>
                    _toggleStarMessage(index), // Added GestureDetector
                child: Padding(
                  padding:
                      messages[previous]["sent"] == messages[current]["sent"]
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
                            maxWidth: MediaQuery.of(context).size.width * 0.8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Text(
                                  messages[index]["message"],
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ),
                              if (messages[index]
                                  ['isStarred']) // Added star icon
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 18,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}