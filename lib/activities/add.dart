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
        shadowColor: Colors.transparent,
        title: const Text("Passwd"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: nameTF,
              decoration: InputDecoration(
                labelText: "Название сервиса",
                errorText: nameEmpty ? "Впишите название" : null,
              ),
            ),
            TextField(
              controller: usernameTF,
              decoration: InputDecoration(
                labelText: "Имя пользователя",
                errorText: usernameEmpty ? "Впишите имя пользователя" : null,
              ),
            ),
            TextField(
              controller: passwordTF,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Пароль",
                errorText: passwordEmpty ? "Впишите пароль" : null,
              ),
            ),
            TextField(
              controller: otpTF,
              decoration: InputDecoration(
                labelText: "Ключ",
                errorText: otpEmpty ? "Впишите ключ OTP" : null,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: IconButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
