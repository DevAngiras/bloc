import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LinkedDevicesPage extends StatefulWidget {
  @override
  _LinkedDevicesPageState createState() => _LinkedDevicesPageState();
}

class _LinkedDevicesPageState extends State<LinkedDevicesPage> {
  List<String> linkedDevices = ['Device 1', 'Device 2'];

  void _addDevice() {
    setState(() {
      linkedDevices.add('New Device ${linkedDevices.length + 1}');
    });
  }

  void _unlinkDevice(int index) {
    setState(() {
      linkedDevices.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Linked Devices',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 7, 121, 67),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 90),
            Image.asset('assets/images/link.png'),
            Text(
              'Use WhatsApp on Web, Desktop, and other devices. Learn more',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addDevice,
              child: Text(
                'Link a Device',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromRGBO(11, 121, 11, 1),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(vertical: 16.0),
                ),
                minimumSize: MaterialStateProperty.all<Size>(
                  Size(double.infinity, 48),
                ),
              ),
            ),
            SizedBox(height: 20),
            Flexible(
              child: ListView.builder(
                itemCount: linkedDevices.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(FontAwesomeIcons.desktop),
                    title: Text(linkedDevices[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _unlinkDevice(index),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your personal messages are end-to-end encrypted',
              style: TextStyle(fontSize: 14.0),
            ),
            SizedBox(height: 5),
            Icon(Icons.lock, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
