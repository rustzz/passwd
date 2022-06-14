import 'package:flutter/material.dart';
import 'package:passwd/widgets/edit_add.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  @override
  Widget build(BuildContext context) {
    return EditAdd(
      nameTF: nameTF,
      usernameTF: usernameTF,
      passwordTF: passwordTF,
      otpTF: otpTF,
      icon: const Icon(Icons.add),
      tooltip: AppLocalizations.of(context)!.addPageTooltip,
    );
  }
}
