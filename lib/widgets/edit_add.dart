import 'package:flutter/material.dart';
import 'package:passwd/widgets/custom.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditAdd extends StatefulWidget {
  const EditAdd(
      {super.key,
      required this.nameTF,
      required this.usernameTF,
      required this.passwordTF,
      required this.otpTF,
      required this.icon,
      required this.tooltip});

  final TextEditingController nameTF;
  final TextEditingController usernameTF;
  final TextEditingController passwordTF;
  final TextEditingController otpTF;
  final String tooltip;
  final Widget icon;

  @override
  EditAddState createState() => EditAddState();
}

class EditAddState extends State<EditAdd> {
  bool nameEmpty = false;
  bool usernameEmpty = false;
  bool passwordEmpty = false;
  bool otpEmpty = false;

  @override
  void dispose() {
    widget.nameTF.dispose();
    widget.usernameTF.dispose();
    widget.passwordTF.dispose();
    widget.otpTF.dispose();
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
              autofocus: true,
              controller: widget.nameTF,
              labelText: AppLocalizations.of(context)!
                  .editAddPageServiceNameTextFieldLabel,
              errorText: nameEmpty
                  ? AppLocalizations.of(context)!
                      .editAddPageServiceNameTextFieldErrorLabel
                  : null,
            ),
            const SizedBox(height: 20),
            MyTextField(
              controller: widget.usernameTF,
              labelText: AppLocalizations.of(context)!
                  .editAddPageUsernameTextFieldLabel,
              errorText: usernameEmpty
                  ? AppLocalizations.of(context)!
                      .editAddPageUsernameTextFieldErrorLabel
                  : null,
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTextField(
                  controller: widget.passwordTF,
                  obscureText: true,
                  labelText: AppLocalizations.of(context)!
                      .editAddPagePasswordTextFieldLabel,
                  errorText: passwordEmpty
                      ? AppLocalizations.of(context)!
                          .editAddPagePasswordTextFieldErrorLabel
                      : null,
                  suffixText: widget.passwordTF.text.length.toString(),
                ),
                const SizedBox(height: 10),
                MyButton(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.of(context).pushNamed("/genPassword");
                    if (result == null) return;
                    widget.passwordTF.text = result["password"];
                  },
                  child: Text(AppLocalizations.of(context)!.generateButtonText),
                ),
              ],
            ),
            const SizedBox(height: 20),
            MyTextField(
              controller: widget.otpTF,
              labelText:
                  AppLocalizations.of(context)!.editAddPageOTPKeyTextFieldLabel,
              errorText: otpEmpty
                  ? AppLocalizations.of(context)!
                      .editAddPageOTPKeyTextFieldErrorLabel
                  : null,
            ),
            const SizedBox(height: 50),
            MyIconButton(
              tooltip: widget.tooltip,
              onPressed: () {
                setState(() {
                  widget.nameTF.text.replaceAll(" ", "").isEmpty
                      ? nameEmpty = true
                      : nameEmpty = false;
                  widget.usernameTF.text.replaceAll(" ", "").isEmpty
                      ? usernameEmpty = true
                      : usernameEmpty = false;
                  widget.passwordTF.text.replaceAll(" ", "").isEmpty
                      ? passwordEmpty = true
                      : passwordEmpty = false;
                  widget.otpTF.text.replaceAll(" ", "").isEmpty
                      ? otpEmpty = true
                      : otpEmpty = false;
                });
                if (nameEmpty || usernameEmpty || passwordEmpty || otpEmpty) {
                  return;
                }
                Navigator.pop(context, {
                  "name": widget.nameTF.text,
                  "username": widget.usernameTF.text,
                  "password": widget.passwordTF.text,
                  "otp": widget.otpTF.text,
                });
              },
              icon: widget.icon,
            ),
          ],
        ),
      ),
    );
  }
}
