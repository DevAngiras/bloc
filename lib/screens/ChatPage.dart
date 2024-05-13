// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.name, required this.image});
  final String name, image;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  void _sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      messages.add({"message": message, "sent": true});
      _messageController.clear();
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    }
  }

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
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
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
                                style: const TextStyle(fontSize: 18),
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
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: "Message",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )),
                ),
                IconButton(
                  icon: const Icon(Icons.send_rounded),
                  onPressed: () {
                    _sendMessage();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
