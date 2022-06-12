import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // const DrawerHeader(
          //   child: Text("Passwd"),
          // ),
          ListTile(
            title: const Text("Passwd"),
            onTap: () {
              //
            },
          ),
          ListTile(
            title: const Text("Настройки"),
            onTap: () {
              //
            },
          ),
        ],
      ),
    );
  }
}