import 'package:flutter/material.dart';

class AboutEditPage extends StatefulWidget {
  final String currentAbout;
  final Function(String) onSave;

  const AboutEditPage({Key? key, required this.currentAbout, required this.onSave})
      : super(key: key);

  @override
  _AboutEditPageState createState() => _AboutEditPageState();
}

class _AboutEditPageState extends State<AboutEditPage> {
  late TextEditingController _aboutController;

  @override
  void initState() {
    super.initState();
    _aboutController = TextEditingController(text: widget.currentAbout);
  }

  @override
  void dispose() {
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _aboutController,
                    maxLines: null, // Allow multiple lines
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      labelText: 'Edit About',
                      
                      suffixIcon: IconButton(
                  onPressed: () {
                    // Handle emoji icon press
                  },
                  icon: Icon(Icons.emoji_emotions_outlined,
                  size: 24,)),
                      
                      alignLabelWithHint: true,
                    ),
                    onChanged: (text) {
                      setState(() {}); // Update UI when text changes
                    },
                  ),
                ),
                SizedBox(width: 10), // Spacer between TextField and Emoji Icon
                
                

              ],
            ),
            SizedBox(height: 10),
            Text(
              '${_aboutController.text.length}',
              style: TextStyle(fontSize: 12),
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
                    String newAbout = _aboutController.text;
                    widget.onSave(newAbout); // Save action
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
