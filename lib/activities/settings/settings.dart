import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:passwd/widgets/custom.dart';
import 'package:passwd/widgets/centered_text.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: CenteredText(text: AppLocalizations.of(context)!.notImplemented),
    );
  }
}
