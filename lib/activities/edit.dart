import 'package:flutter/material.dart';
import 'package:passwd/widgets/edit_add.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditArgs {
  final String name;
  final String username;
  final String password;
  final String otp;

  EditArgs(this.name, this.username, this.password, this.otp);
}

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  EditState createState() => EditState();
}

class EditState extends State<Edit> {
  final nameTF = TextEditingController();
  final usernameTF = TextEditingController();
  final passwordTF = TextEditingController();
  final otpTF = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as EditArgs;
    setState(() {
      nameTF.text = args.name;
      usernameTF.text = args.username;
      passwordTF.text = args.password;
      otpTF.text = args.otp;
    });
    return EditAdd(
      nameTF: nameTF,
      usernameTF: usernameTF,
      passwordTF: passwordTF,
      otpTF: otpTF,
      icon: const Icon(Icons.edit),
      tooltip: AppLocalizations.of(context)!.editPageTooltip,
    );
  }
}
