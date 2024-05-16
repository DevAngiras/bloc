import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.name, required this.image}) : super(key: key);
  final String name, image;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  List<Map<String, dynamic>> messages = [
    {"message": "Hola!", "sent": false},
    {"message": "Nevermind!", "sent": false},
    {"message": "Hello!", "sent": true},
    {"message": "Hi!", "sent": false},
    {"message": "How are you?", "sent": true},
    {"message": "All good! What about you?", "sent": false},
    {"message": "Same here!", "sent": true},
    {"message": "Had lunch?", "sent": false},
    {"message": "Yes! What about you?", "sent": true},
    {"message": "Not yet, Please order me a pizza", "sent": false},
    {"message": "Hahaha, Sure!", "sent": true},
    {"message": "From where do you want to eat?", "sent": true},
    {"message": "Dominos would be good!", "sent": false},
    {"message": "Okay!", "sent": true},
    {"message": "Which one?", "sent": true},
    {"message": "Golden corn with cheese burst would be great!", "sent": false},
    {"message": "Sure!", "sent": true},
    {"message": "I am ordering a Large Golden corn cheese burst", "sent": true},
  ];

  void _muteChat() {
    setState(() {
      _isMuted = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Chat muted'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showMuteOptionsDialog() {              // alert dialog box appears when mute option is selected
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Mute options"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Mute for 8 hours"),
                onTap: () {
                  _muteChatFor(Duration(hours: 8));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("Mute for 24 hours"),
                onTap: () {
                  _muteChatFor(Duration(hours: 24));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("Mute always"),
                onTap: () {
                  _muteChatFor(Duration(days: 365 * 100)); // Mute for a long time
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _muteChatFor(Duration duration) {
    setState(() {
      _isMuted = true;
    });
    // Handle mute duration logic here, such as storing it locally or sending it to the server.
    ScaffoldMessenger.of(context).showSnackBar(                             // apperars at the bottom of the page for 2 seconds
      SnackBar(
        content: Text('Chat muted for ${_formatDuration(duration)}'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    if (duration.inDays >= 365 * 100) {
      return 'forever';
    } else if (duration.inHours >= 24) {
      return '${duration.inDays} days';
    } else {
      return '${duration.inHours} hours';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.video_call),
                Icon(Icons.call),
                PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return <PopupMenuEntry>[
                      PopupMenuItem(
                        value: "mute",
                        child: Text("Mute"),      // when we tap on menu then chat is muted
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == "mute") {
                      _showMuteOptionsDialog();
                    }
                  },
                ),
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
            return Padding(
              padding: messages[previous]["sent"] == messages[current]["sent"]
                  ? const EdgeInsets.only(left: 8, right: 8, top: 4)
                  : const EdgeInsets.only(left: 8, right: 8, top: 8),
              child: Align(
                alignment: messages[index]["sent"] ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: messages[index]["sent"] ? Colors.amber[200] : Colors.blue[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
                      child: Text(
                        messages[index]["message"],
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
