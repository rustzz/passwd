import 'package:flutter/material.dart';
import 'package:passwd/widgets/custom.dart';

class PINInputPage extends StatefulWidget {
  const PINInputPage({super.key});

  @override
  PINInputPageState createState() => PINInputPageState();
}

class PINInputPageState extends State<PINInputPage> {
  FocusNode firstFocus = FocusNode();
  FocusNode secondFocus = FocusNode();
  FocusNode thirdFocus = FocusNode();
  FocusNode fourFocus = FocusNode();

  TextEditingController firstInput = TextEditingController();
  TextEditingController secondInput = TextEditingController();
  TextEditingController thirdInput = TextEditingController();
  TextEditingController fourInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 30),
              MyTextFieldPassword(
                focusNode: firstFocus,
                inputController: firstInput,
                func: (value) {
                  if (firstInput.text.isNotEmpty) {
                    secondFocus.requestFocus();
                    secondInput.text = "";
                  }
                },
              ),
              MyTextFieldPassword(
                focusNode: secondFocus,
                inputController: secondInput,
                func: (value) {
                  if (secondInput.text.isNotEmpty) {
                    thirdFocus.requestFocus();
                    thirdInput.text = "";
                  }
                },
              ),
              MyTextFieldPassword(
                focusNode: thirdFocus,
                inputController: thirdInput,
                func: (value) {
                  if (thirdInput.text.isNotEmpty) {
                    fourFocus.requestFocus();
                    fourInput.text = "";
                  }
                },
              ),
              MyTextFieldPassword(
                focusNode: fourFocus,
                inputController: fourInput,
                func: (value) {
                  if (fourInput.text.isNotEmpty) {
                    // firstFocus.requestFocus();
                    // firstInput.text = "";
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/home", (route) => false);
                  }
                },
              ),
              const SizedBox(width: 30),
            ],
          ),
        ],
      ),
    );
  }
}
