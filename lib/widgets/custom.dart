import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwd/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField({
    Key? key,
    this.controller,
    this.autofocus = false,
    this.obscureText = false,
    this.labelText,
    this.errorText,
    this.suffixText,
  }) : super(key: key);

  TextEditingController? controller;
  bool autofocus;
  bool obscureText;
  String? labelText;
  String? errorText;
  String? suffixText;
  FocusNode focusNode = FocusNode();

  @override
  MyTextFieldState createState() => MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  bool obsOverride = false;

  @override
  void initState() {
    if (widget.autofocus) widget.focusNode.requestFocus();
    obsOverride = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget suffixIcon = IconButton(
      tooltip: widget.obscureText
          ? AppLocalizations.of(context)!.textFieldIconButtonTooltipShow
          : AppLocalizations.of(context)!.textFieldIconButtonTooltipHide,
      icon: Icon(
        widget.obscureText ? Icons.visibility : Icons.visibility_off,
        color: widgetBGColor,
      ),
      onPressed: () {
        setState(() {
          widget.obscureText = !widget.obscureText;
        });
      },
    );
    return TextField(
      focusNode: widget.focusNode,
      onChanged: (value) {
        setState(() {
          widget.suffixText = widget.obscureText
              ? widget.controller!.text.length.toString()
              : null;
        });
      },
      cursorColor: widgetBGColor,
      autofocus: widget.autofocus,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixText: widget.suffixText,
        suffixIcon: obsOverride ? suffixIcon : null,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: widgetBGColor,
            width: 3,
          ),
          borderRadius: borderRadius,
        ),
        border: const OutlineInputBorder(
          borderRadius: borderRadius,
        ),
        labelText: widget.labelText,
        errorText: widget.errorText,
      ),
      obscureText: widget.obscureText,
    );
  }
}

// ignore: must_be_immutable
class MyTextFieldPassword extends StatefulWidget {
  MyTextFieldPassword({
    super.key,
    this.autofocus = false,
    required this.focusNode,
    required this.inputController,
    required this.func,
  });

  bool autofocus;
  FocusNode focusNode = FocusNode();
  TextEditingController inputController;
  Function(String) func;

  @override
  MyTextFieldPasswordState createState() => MyTextFieldPasswordState();
}

class MyTextFieldPasswordState extends State<MyTextFieldPassword> {
  @override
  void initState() {
    if (widget.autofocus) widget.focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      child: TextField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        keyboardType: TextInputType.number,
        onChanged: widget.func,
        decoration: const InputDecoration(
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widgetBGColor,
              width: 3,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        focusNode: widget.focusNode,
        controller: widget.inputController,
        autofocus: widget.autofocus,
        maxLength: 1,
        textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}

// Button
class MyButton extends StatelessWidget {
  const MyButton({Key? key, this.onPressed, this.child}) : super(key: key);

  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.all(widgetBGColor),
        foregroundColor: MaterialStateProperty.all(widgetFGColor),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

// Card
class MyCard extends StatefulWidget {
  const MyCard(
      {Key? key,
      required this.name,
      required this.username,
      required this.onPressedDelete,
      required this.onPressedEdit})
      : super(key: key);

  final String name;
  final String username;
  final VoidCallback onPressedDelete;
  final VoidCallback onPressedEdit;

  @override
  MyCardState createState() => MyCardState();
}

class MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      shape: const RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Text(widget.name),
                  subtitle: Text(widget.username),
                ),
              ),
              IconButton(
                tooltip:
                    AppLocalizations.of(context)!.cardIconButtonTooltipDelete,
                onPressed: widget.onPressedDelete,
                icon: const Icon(Icons.delete),
              ),
              IconButton(
                tooltip:
                    AppLocalizations.of(context)!.cardIconButtonTooltipEdit,
                onPressed: widget.onPressedEdit,
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Scaffold
class MyScaffold extends StatelessWidget {
  const MyScaffold(
      {Key? key,
      this.drawer,
      this.body,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.automaticallyImplyLeading = true})
      : super(key: key);

  final bool automaticallyImplyLeading;
  final Widget? drawer;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      appBar: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        title: Text(AppLocalizations.of(context)!.appName),
        centerTitle: true,
      ),
    );
  }
}

// IconButton with background color
class MyIconButton extends StatelessWidget {
  const MyIconButton(
      {super.key,
      required this.onPressed,
      required this.tooltip,
      required this.icon});

  final VoidCallback onPressed;
  final String tooltip;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      child: CircleAvatar(
        radius: 35,
        backgroundColor: widgetBGColor,
        foregroundColor: widgetFGColor,
        child: IconButton(
          tooltip: tooltip,
          onPressed: onPressed,
          icon: icon,
        ),
      ),
    );
  }
}
