import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Service {
  final String name, username, password, otp;
  Service(this.name, this.username, this.password, this.otp);
}

class CardInfo extends StatefulWidget {
  const CardInfo({
    Key? key,
    required this.serviceList,
    required this.indexOfCard,
  }) : super(key: key);

  final List<Service> serviceList;
  final int indexOfCard;

  @override
  CardInfoState createState() => CardInfoState();
}

class CardInfoState extends State<CardInfo> with TickerProviderStateMixin {
  late AnimationController passwordTimeLineController;

  @override
  void initState() {
    passwordTimeLineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    passwordTimeLineController.addListener(() {
      setState(() {});
    });
    passwordTimeLineController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    passwordTimeLineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        color: Color(0xFF424242),
      ),
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SizedBox(
            height: (65 * 5).toDouble(),
            child: Stack(
              children: [
                Positioned(
                  child: ListView(
                    physics:
                    const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      const Center(
                        child: Text(
                          "Информация",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      ListTile(
                        title: const Text("Сервис"),
                        subtitle:
                        Text(widget.serviceList[widget.indexOfCard].name),
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: widget.serviceList[widget.indexOfCard].name));
                        },
                      ),
                      ListTile(
                        title: const Text("Пользователь"),
                        subtitle:
                        Text(widget.serviceList[widget.indexOfCard].username),
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: widget.serviceList[widget.indexOfCard].username));
                        },
                      ),
                      ListTile(
                        title: const Text("Пароль"),
                        subtitle:
                        const Text("• • • • • • • •"),
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: widget.serviceList[widget.indexOfCard].password));
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              title: const Text("Ключ"),
                              subtitle: Text(
                                  widget.serviceList[widget.indexOfCard].otp),
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: widget.serviceList[widget.indexOfCard].otp));
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: CircularProgressIndicator(
                              value: passwordTimeLineController.value,
                              strokeWidth: 8,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}