import 'package:flutter/material.dart';
import 'constants.dart';

// TextField
//ignore: must_be_immutable
class MyTextField extends StatefulWidget {
  MyTextField(
      {Key? key,
      this.controller,
      this.autofocus = false,
      this.obscureText = false,
      this.labelText,
      this.errorText,
      this.suffixText})
      : super(key: key);

  final TextEditingController? controller;
  final bool autofocus;
  bool obscureText;
  final String? labelText;
  final String? errorText;
  final String? suffixText;

  @override
  MyTextFieldState createState() => MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  bool obsOverride = false;

  @override
  void initState() {
    obsOverride = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget suffixIcon = IconButton(
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
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelText: widget.labelText,
        errorText: widget.errorText,
      ),
      obscureText: widget.obscureText,
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
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.name),
            subtitle: Text(widget.username),
          ),
          Row(
            children: [
              IconButton(
                tooltip: "Удалить",
                onPressed: widget.onPressedDelete,
                icon: const Icon(Icons.delete),
              ),
              IconButton(
                tooltip: "Изменить",
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
        title: const Text("Passwd"),
        centerTitle: true,
      ),
    );
  }
}
