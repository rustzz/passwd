import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:passwd/constants.dart';

class Service {
  final String name, username, password, otpKey;
  Service(this.name, this.username, this.password, this.otpKey);
}

class CardInfoLayout extends StatefulWidget {
  const CardInfoLayout({
    Key? key,
    required this.serviceList,
    required this.indexOfCard,
  }) : super(key: key);

  final List<Service> serviceList;
  final int indexOfCard;

  @override
  CardInfoLayoutState createState() => CardInfoLayoutState();
}

class CardInfoLayoutState extends State<CardInfoLayout>
    with TickerProviderStateMixin {
  late AnimationController otpTimeLineController;

  @override
  void initState() {
    otpTimeLineController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    otpTimeLineController.addListener(() {
      setState(() {});
    });
    otpTimeLineController.repeat(reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    otpTimeLineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          color: cardInfoBGColor,
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
                      physics: const NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Center(
                          child: Text(
                            AppLocalizations.of(context)!.cardInfoTitle,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        ListTile(
                          title: Text(AppLocalizations.of(context)!
                              .cardInfoServiceNameTitle),
                          subtitle:
                              Text(widget.serviceList[widget.indexOfCard].name),
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: widget
                                    .serviceList[widget.indexOfCard].name));
                          },
                        ),
                        ListTile(
                          title: Text(AppLocalizations.of(context)!
                              .cardInfoUsernameTitle),
                          subtitle: Text(
                              widget.serviceList[widget.indexOfCard].username),
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: widget
                                    .serviceList[widget.indexOfCard].username));
                          },
                        ),
                        ListTile(
                          title: Text(AppLocalizations.of(context)!
                              .cardInfoPasswordTitle),
                          subtitle: const Text("• • • • • • • •"),
                          onTap: () {
                            Clipboard.setData(ClipboardData(
                                text: widget
                                    .serviceList[widget.indexOfCard].password));
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(AppLocalizations.of(context)!
                                    .cardInfoOTPKeyTitle),
                                subtitle: Text(widget
                                    .serviceList[widget.indexOfCard].otpKey),
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                      text: widget
                                          .serviceList[widget.indexOfCard]
                                          .otpKey));
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: CircularProgressIndicator(
                                value: otpTimeLineController.value,
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
      ),
    );
  }
}
