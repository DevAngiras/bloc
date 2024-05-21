import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
 bool _notificationTone = false;
 bool _notificationReaction = false;
 bool _notificationTopScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Notification'),
        actions: [
          PopupMenuButton<String>(
              itemBuilder: (context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(child: Icon(Icons.more_vert))
                  ])
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Conversation tones"),
            subtitle: Text("play sounds for incoming and outgoing messsages"),
            trailing: Switch(
              value:_notificationTone,
              onChanged: (value) {
                setState(() {
                  _notificationTone = value;
                });
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, width: 2),top: BorderSide(color: Colors.black, width: 2))),
           child: Column(
            children: [
              Text("messages", textAlign: TextAlign.left,),
               ListTile(
                title: Text("Notification Tone"),
                subtitle: Text("Default (milky way)"),
              ),
              
              
              
              ListTile(
                title: Text("Vibrate"),
                subtitle: Text("Default "),
              ),
              ListTile(
                title: Text("pop notification "),
                subtitle: Text("not available"),
              ),
              ListTile(
                title: Text("Light"),
                subtitle: Text("white"),
              ),
                ListTile(
            title: Text("Use high priority notification"),
            subtitle: Text("show preview of the notification at the top of the screen"),
            trailing: Switch(
              value:_notificationTopScreen,
              onChanged: (value) {
                setState(() {
                  _notificationTopScreen = value;
                });
              },
            ),),
          ListTile(
            title: Text("Reaction Notifications"),
            subtitle: Text("show notification to the messages you send"),
            trailing: Switch(
              value:_notificationReaction,
              onChanged: (value) {
                setState(() {
                _notificationReaction= value;
                });
              },
            ),
          ),
                   
              
           
            ],
           ), 
          ),
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, width: 2))),
           child: Column(
            children: [
              Text("groups", textAlign: TextAlign.left,),
               ListTile(
                title: Text("Notification Tone"),
                subtitle: Text("Default (milky way)"),
              ),
              
              
              
              ListTile(
                title: Text("Vibrate"),
                subtitle: Text("Default "),
              ),
              ListTile(
                title: Text("pop notification "),
                subtitle: Text("not available"),
              ),
              ListTile(
                title: Text("Light"),
                subtitle: Text("white"),
              ),
                ListTile(
            title: Text("Use high priority notification"),
            subtitle: Text("show preview of the notification at the top of the screen"),
            trailing: Switch(
              value:_notificationTopScreen,
              onChanged: (value) {
                setState(() {
                  _notificationTopScreen = value;
                });
              },
            ),),
          ListTile(
            title: Text("Reaction Notifications"),
            subtitle: Text("show notification to the messages you send"),
            trailing: Switch(
              value:_notificationReaction,
              onChanged: (value) {
                setState(() {
                _notificationReaction= value;
                });
              },
            ),
          ),
         
    
           
            ],
           ), 
          ),

          
           
        ],
      ),
    );
  }
}
