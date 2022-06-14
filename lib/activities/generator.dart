import 'package:flutter/material.dart';
import 'package:random_password_generator/random_password_generator.dart';
import 'package:passwd/widgets/custom.dart';
import 'package:passwd/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  void initState() {
    genPasswordTF.text = password.randomPassword(
      letters: enableLetters,
      uppercase: enableUppercase,
      numbers: enableNumbers,
      specialChar: enableSpecialChar,
      passwordLength: passwordLength,
    );
    super.initState();
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
              labelText: AppLocalizations.of(context)!
                  .generatorPagePasswordTextFieldLabel,
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
                        Text(AppLocalizations.of(context)!
                            .generatorPageLettersCheckboxText),
                        Checkbox(
                          activeColor: widgetBGColor,
                          value: enableLetters,
                          onChanged: (value) {
                            setState(() {
                              if (enableUppercase) {
                                errorTextLetters = Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(
                                      AppLocalizations.of(context)!
                                          .generatorPageUppercaseError,
                                      style: const TextStyle(color: Colors.red),
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
                        Text(AppLocalizations.of(context)!
                            .generatorPageUppercaseCheckboxText),
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
                    Text(AppLocalizations.of(context)!
                        .generatorPageNumbersCheckboxText),
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
                    Text(AppLocalizations.of(context)!
                        .generatorPageSpecialCharsCheckboxText),
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
                const SizedBox(height: 15),
                Text(AppLocalizations.of(context)!
                    .generatorPageSymbolCountSliderTitle),
                Slider(
                  activeColor: widgetBGColor,
                  value: passwordLength,
                  onChanged: (value) {
                    setState(() {
                      passwordLength = value;
                      genPasswordTF.text = password.randomPassword(
                        letters: enableLetters,
                        uppercase: enableUppercase,
                        numbers: enableNumbers,
                        specialChar: enableSpecialChar,
                        passwordLength: passwordLength,
                      );
                    });
                  },
                  min: 6,
                  max: 32,
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
              child: Text(AppLocalizations.of(context)!.generateButtonText),
            ),
            const SizedBox(height: 50),
            MyIconButton(
              tooltip:
                  AppLocalizations.of(context)!.generatorPageDoneButtonTooltip,
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
