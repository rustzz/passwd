import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Passwd"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 10),
            TextField(
              autofocus: true,
              controller: nameTF,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Название сервиса",
                errorText: nameEmpty ? "Впишите название" : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: usernameTF,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Имя пользователя",
                errorText: usernameEmpty ? "Впишите имя пользователя" : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordTF,
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Пароль",
                errorText: passwordEmpty ? "Впишите пароль" : null,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: otpTF,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Ключ",
                errorText: otpEmpty ? "Впишите ключ OTP" : null,
              ),
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
