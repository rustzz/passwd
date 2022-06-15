import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.navDrawerHomePageTitle),
            onTap: () {
              //
            },
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.navDrawerSettingsTitle),
            onTap: () {
              //
            },
          ),
        ],
      ),
    );
  }
}
