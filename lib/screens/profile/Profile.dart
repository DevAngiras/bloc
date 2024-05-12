import 'package:flutter/material.dart';
import 'package:test_app/screens/profile/AboutEditPage.dart';
import 'package:test_app/screens/profile/NameEditPage.dart';

// ProfileEditPage

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _profileName = '🦋💜 Shinobu Kochou 💜🦋';
  String _aboutSection =
      "I may be the only swords-lady among the Pillars who can't cut a demon's head off. But anyone who creates poison that can kill demons can be quite amazing.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Handle back button press
              },
            ),
            Text('Profile'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/Profile_pic.jpg'),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 130,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 191, 180, 255),
                    ),
                    padding: EdgeInsets.all(5),
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt_outlined,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _navigateToNameEdit(context);
              },
              child: ProfileItem(
                icon: Icons.person_outlined,
                title: 'Name',
                value: _profileName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 20, 0),
              child: Text(
                'This is not your username or pin. This name will be visible to others.',
                style: TextStyle(
                  color: Color.fromARGB(255, 119, 119, 119),
                  fontSize: 12,
                ),
              ),
            ),
            _buildDivider(),
            // ProfileEditPage

            GestureDetector(
              onTap: () {
                _navigateToAboutEdit(context);
              },
              child: ProfileItem(
                icon: Icons.info_outline,
                title: 'About',
                value: _aboutSection,
              ),
            ),

            _buildDivider(),
            ProfileItem(
              icon: Icons.phone_outlined,
              title: 'Phone',
              value: '+91 9876543210',
              showEditIcon: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60, 0, 20, 0),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }

  void _navigateToNameEdit(BuildContext context) async {
    final newName = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NameEditPage(
          currentName: _profileName,
          onSave: (newName) {
            setState(() {
              _profileName = newName; // Update the name in the UI
            });
          },
        ),
      ),
    );
    if (newName != null) {
      print('New Name: $newName');
    }
  }

  void _navigateToAboutEdit(BuildContext context) async {
    final newAbout = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutEditPage(
          currentAbout: _aboutSection,
          onSave: (newAbout) {
            setState(() {
              _aboutSection = newAbout; // Update the name in the UI
            });
          },
        ),
      ),
    );
    if (newAbout != null) {
      print('New About: $newAbout');
    }
  }
}

// ProfileItem

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final bool showEditIcon;

  const ProfileItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.value,
    this.showEditIcon = true, // default value to true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  maxLines: 1, // Set maximum number of lines
                  overflow: TextOverflow.ellipsis, // Overflow ellipsis
                ),
              ],
            ),
          ),
          if (showEditIcon) SizedBox(width: 25),
          if (showEditIcon) Icon(Icons.edit_outlined),
        ],
      ),
    );
  }
}
