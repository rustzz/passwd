import 'package:flutter/material.dart';
import 'package:passwd/activities/home.dart';
import 'package:passwd/activities/add.dart';
import 'package:passwd/activities/edit.dart';

void main() {
	runApp(const PasswdApp());
}

class PasswdApp extends StatelessWidget {
	const PasswdApp({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			theme: ThemeData(brightness: Brightness.light),
			darkTheme: ThemeData(brightness: Brightness.dark),
			themeMode: ThemeMode.dark,
			initialRoute: "/",
			routes: {
				"/": (context) => const Home(),
				"/add": (context) => const Add(),
				"/edit": (context) => const Edit(),
			},
		);
	}
}
