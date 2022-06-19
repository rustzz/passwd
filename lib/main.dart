import 'package:flutter/material.dart';
import 'package:passwd/activities/home/home.dart';
import 'package:passwd/activities/add.dart';
import 'package:passwd/activities/edit.dart';
import 'package:passwd/activities/generator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:passwd/activities/pin_input.dart';
import 'package:passwd/activities/settings/settings.dart';
import 'package:window_size/window_size.dart';
import 'package:flutter/foundation.dart';
import 'package:passwd/constants.dart';
import 'package:flutter/services.dart';
import 'dart:io';

void setupApp() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowMinSize(windowSize);
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowSize.width,
        height: windowSize.height,
      ));
    });
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: overlayColor,
    statusBarColor: overlayColor,
  ));
}

void main() {
  setupApp();
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
        "/": (context) => const PINInputPage(),
        "/home": (context) => const HomePage(),
        "/add": (context) => const AddPage(),
        "/edit": (context) => const EditPage(),
        "/genPassword": (context) => const GenPage(),
        "/settings": (context) => const SettingsPage(),
      },
    );
  }
}
