import 'package:flutter/material.dart';

class MyPopUpMenuButton extends StatelessWidget {
  final List menuList;
  const MyPopUpMenuButton({super.key, required this.menuList});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        itemBuilder: ((BuildContext context) => <PopupMenuEntry<String>>[
              for (var i = 0; i < menuList.length; i++)
                PopupMenuItem<String>(
                  value: menuList[i],
                  child: Text(menuList[i]),
                ),
            ]));
  }
}
