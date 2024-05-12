import 'package:flutter/material.dart';

// NameEditPage

class NameEditPage extends StatefulWidget {
  final String currentName;
  final Function(String) onSave;

  const NameEditPage(
      {Key? key, required this.currentName, required this.onSave})
      : super(key: key);

  @override
  _NameEditPageState createState() => _NameEditPageState();
}

class _NameEditPageState extends State<NameEditPage> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              maxLength: 21,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                suffixIcon: IconButton(
                    onPressed: () {
                      // Handle emoji icon press
                    },
                    icon: Icon(
                      Icons.emoji_emotions_outlined,
                      size: 24,
                    )),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cancel action
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    String newName = _nameController.text;
                    widget.onSave(newName); // Save action
                    Navigator.pop(context);
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
