import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Service {
  final String name, username, password, otp;
  Service(this.name, this.username, this.password, this.otp);
}

class CardInfo extends StatelessWidget {
  const CardInfo({
    Key? key,
    required this.serviceList,
    required this.passwordTimeLineController,
    required this.indexOfCard,
  }) : super(key: key);

  final List<Service> serviceList;
  final AnimationController passwordTimeLineController;
  final int indexOfCard;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          color: Color(0xFF424242),
        ),
        child: Column(
          children: [
            SizedBox(
              height: (65 * 5).toDouble(),
              child: Container(
                padding: const EdgeInsets.only(top: 20),
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
                            Text(serviceList[indexOfCard].name),
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: serviceList[indexOfCard].name));
                            },
                          ),
                          ListTile(
                            title: const Text("Пользователь"),
                            subtitle:
                            Text(serviceList[indexOfCard].username),
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: serviceList[indexOfCard].username));
                            },
                          ),
                          ListTile(
                            title: const Text("Пароль"),
                            subtitle:
                            const Text("• • • • • • • •"),
                            onTap: () {
                              Clipboard.setData(ClipboardData(text: serviceList[indexOfCard].password));
                            },
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: const Text("Ключ"),
                                  subtitle: Text(
                                      serviceList[indexOfCard].otp),
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(text: serviceList[indexOfCard].otp));
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
            ),
          ],
        ),
      ),
    );
  }
}