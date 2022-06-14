import 'package:flutter/material.dart';
import 'package:passwd/activities/home/home.dart';
import 'package:passwd/activities/add.dart';
import 'package:passwd/activities/edit.dart';
import 'package:passwd/activities/generator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const PasswdApp());
}

class PasswdApp extends StatelessWidget {
  const PasswdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) {
        return AppLocalizations.of(context)!.appName;
      },
      theme: ThemeData(
        // useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: "Roboto",
      ),
      darkTheme: ThemeData(
        // useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: "Roboto",
      ),
      themeMode: ThemeMode.dark,
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/add": (context) => const Add(),
        "/edit": (context) => const Edit(),
        "/genPassword": (context) => const GenPage(),
      },
    );
  }
}
