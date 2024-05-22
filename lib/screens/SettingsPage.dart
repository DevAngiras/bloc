import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final bool showLastSeen;
  final ValueChanged<bool> onShowLastSeenChanged;

  SettingsPage({
    required this.showLastSeen,
    required this.onShowLastSeenChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Show Last Seen'),
              value: showLastSeen,
              onChanged: onShowLastSeenChanged,
            ),
          ],
        ),
      ),
    );
  }
}
