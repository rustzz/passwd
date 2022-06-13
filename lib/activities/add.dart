import 'package:flutter/material.dart';
import 'package:passwd/widgets.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  AddState createState() => AddState();
}

class AddState extends State<Add> {
  final nameTF = TextEditingController();
  final usernameTF = TextEditingController();
  final passwordTF = TextEditingController();
  final otpTF = TextEditingController();

  bool nameEmpty = false;
  bool usernameEmpty = false;
  bool passwordEmpty = false;
  bool otpEmpty = false;

  @override
  void dispose() {
    nameTF.dispose();
    usernameTF.dispose();
    passwordTF.dispose();
    otpTF.dispose();
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
              controller: nameTF,
              labelText: "Название сервиса",
              errorText: nameEmpty ? "Впишите название" : null,
            ),
            const SizedBox(height: 20),
            MyTextField(
              controller: usernameTF,
              labelText: "Имя пользователя",
              errorText: usernameEmpty ? "Впишите имя пользователя" : null,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    controller: passwordTF,
                    obscureText: true,
                    labelText: "Пароль",
                    errorText: passwordEmpty ? "Впишите пароль" : null,
                    suffixText: passwordTF.text.length.toString(),
                  ),
                ),
                const SizedBox(width: 10),
                MyButton(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.of(context).pushNamed("/genPassword");
                    if (result == null) return;
                    passwordTF.text = result["password"];
                  },
                  child: const Text("Генерировать"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            MyTextField(
              controller: otpTF,
              labelText: "Ключ",
              errorText: otpEmpty ? "Впишите ключ OTP" : null,
            ),
            const SizedBox(height: 50),
            IconButton(
              onPressed: () {
                setState(() {
                  nameTF.text.replaceAll(" ", "").isEmpty
                      ? nameEmpty = true
                      : nameEmpty = false;
                  usernameTF.text.replaceAll(" ", "").isEmpty
                      ? usernameEmpty = true
                      : usernameEmpty = false;
                  passwordTF.text.replaceAll(" ", "").isEmpty
                      ? passwordEmpty = true
                      : passwordEmpty = false;
                  otpTF.text.replaceAll(" ", "").isEmpty
                      ? otpEmpty = true
                      : otpEmpty = false;
                });
                if (nameEmpty || usernameEmpty || passwordEmpty || otpEmpty) {
                  return;
                }
                Navigator.pop(context, {
                  "name": nameTF.text,
                  "username": usernameTF.text,
                  "password": passwordTF.text,
                  "otp": otpTF.text,
                });
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
