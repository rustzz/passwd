import 'package:flutter/material.dart';
import 'package:random_password_generator/random_password_generator.dart';
import 'package:passwd/widgets.dart';
import 'package:passwd/constants.dart';

class GenPage extends StatefulWidget {
  const GenPage({Key? key}) : super(key: key);

  @override
  GenPageState createState() => GenPageState();
}

class GenPageState extends State<GenPage> {
  final genPasswordTF = TextEditingController();
  final password = RandomPasswordGenerator();
  bool enableLetters = true;
  bool enableSpecialChar = true;
  bool enableNumbers = true;
  bool enableUppercase = true;
  double passwordLength = 8;
  Widget errorTextLetters = const SizedBox(height: 10);

  @override
  void dispose() {
    genPasswordTF.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            MyTextField(
              controller: genPasswordTF,
              labelText: "Пароль",
              suffixText: passwordLength.round().toString(),
            ),
            Column(
              children: [
                errorTextLetters,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text("Буквы"),
                        Checkbox(
                          activeColor: widgetBGColor,
                          value: enableLetters,
                          onChanged: (value) {
                            setState(() {
                              if (enableUppercase) {
                                errorTextLetters = const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      "Вы не можете отключить \"Буквы\", "
                                      "пока включен \"Верхний регистр\"",
                                      style: TextStyle(color: Colors.red),
                                    ));
                                return;
                              }
                              if (enableNumbers ||
                                  enableSpecialChar ||
                                  enableUppercase) {
                                enableLetters = value!;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text("Верхний регистр"),
                        Checkbox(
                          activeColor: widgetBGColor,
                          value: enableUppercase,
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                enableLetters = true;
                              }
                              if (enableLetters ||
                                  enableNumbers ||
                                  enableSpecialChar) {
                                enableUppercase = value;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Цифры"),
                    Checkbox(
                      activeColor: widgetBGColor,
                      value: enableNumbers,
                      onChanged: (value) {
                        setState(() {
                          if (enableLetters ||
                              enableSpecialChar ||
                              enableUppercase) {
                            enableNumbers = value!;
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text("Спец. символы"),
                    Checkbox(
                      activeColor: widgetBGColor,
                      value: enableSpecialChar,
                      onChanged: (value) {
                        setState(() {
                          if (enableLetters ||
                              enableNumbers ||
                              enableUppercase) {
                            enableSpecialChar = value!;
                          }
                        });
                      },
                    ),
                  ],
                ),
                Slider(
                  activeColor: widgetBGColor,
                  value: passwordLength,
                  onChanged: (value) {
                    setState(() {
                      passwordLength = value;
                    });
                  },
                  min: 8.0,
                  max: 32.0,
                ),
              ],
            ),
            const SizedBox(height: 20),
            MyButton(
              onPressed: () {
                genPasswordTF.text = password.randomPassword(
                  letters: enableLetters,
                  uppercase: enableUppercase,
                  numbers: enableNumbers,
                  specialChar: enableSpecialChar,
                  passwordLength: passwordLength,
                );
              },
              child: const Text("Генерировать"),
            ),
            const SizedBox(height: 50),
            IconButton(
              onPressed: () {
                Navigator.pop(context, {"password": genPasswordTF.text});
              },
              icon: const Icon(Icons.done),
            ),
          ],
        ),
      ),
    );
  }
}
