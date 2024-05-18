// ignore_for_file: file_names

import 'package:flutter/material.dart';

typedef OnEmojiReactionLongClickListener = void Function(int index);

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.name, required this.image});
  final String name, image;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();

  get onEmojiReactionLongClickListener => null;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  setOnEmojiReactionLongClickListener(index) {
    // Handle the long click on the message at `index`.
    // For example, show a dialog with emoji reactions.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("React to message"),
          content: Text("Long pressed message at index: $index"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  List<Map<String, dynamic>> messages = [
    {
      "message": "Hola!",
      "sent": false,
      "reactions": {'👍': 0, '❤️': 0, '😄': 0},
    },
    {
      "message": "Nevermind!",
      "sent": false,
      "reactions": {'👍': 0, '❤️': 0, '😄': 0},
    },
    {
      "message": "Hello!",
      "sent": true,
      "reactions": {'👍': 0, '❤️': 0, '😄': 0},
    },
    {
      "message": "Hi!",
      "sent": false,
      "reactions": {'👍': 0, '❤️': 0, '😄': 0},
    },
    {
      "message": "How are you?",
      "sent": true,
      "reactions": {'👍': 0, '❤️': 0, '😄': 0},
    },
    {
      "message": "All good! What about you?",
      "sent": false,
      "reactions": {'👍': 0, '❤️': 0, '😄': 0},
    },
    // Add more messages here as needed...
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
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                controller: _scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  int previous = index - 1 >= 0 ? index - 1 : 0;
                  int current = index;
                  return GestureDetector(onLongPress: () {
                    if (onEmojiReactionLongClickListener != null) {
                      onEmojiReactionLongClickListener!(index);
                    }
                    Padding(
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
                            )));
                  });
                })));
  }
}
