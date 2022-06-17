import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  const CenteredText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(text)),
      ],
    );
  }
}
