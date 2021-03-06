import 'package:flutter/material.dart';
import 'package:passwd/activities/home/layouts/card_info.dart';
// import 'package:passwd/activities/home/layouts/nav.dart';
import 'package:passwd/constants.dart';
import 'package:passwd/widgets/custom.dart';
import 'package:passwd/activities/edit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Service> serviceList = [];

  @override
  void initState() {
    // for tests
    serviceList.add(Service("Youtube", "rustzz", "qwerty1", "1"));
    serviceList.add(Service("VK", "rustzz", "qwerty12", "12"));
    serviceList.add(Service("Stackoverflow", "rustzz", "qwerty123", "123"));
    serviceList.add(Service("4PDA", "rustzz", "qwerty1234", "1234"));
    serviceList.add(Service("Github", "rustzz", "qwerty12345", "12345"));
    serviceList.add(Service("Gentoo", "rustzz", "qwerty123456", "123456"));
    serviceList.add(Service("LibreFM", "rustzz", "qwerty1234567", "123456"));
    serviceList.add(Service("Google", "rustzz", "qwerty12345678", "123456"));
    serviceList.add(Service("Dropbox", "rustzz", "qwerty123", "123456"));
    serviceList.add(Service("Genius", "rustzz", "qwerty123", "123456"));
    serviceList.add(Service("Heroku", "rustzz", "qwerty123", "123456"));
    serviceList.add(Service("LOR", "rustzz", "qwerty123", "123456"));
    serviceList.add(Service("Microsoft", "rustzz", "qwerty123", "123456"));
    serviceList.add(Service("Facebook", "rustzz", "qwerty123", "123456"));
    serviceList.add(Service("Reddit", "rustzz", "qwerty123", "123456"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      automaticallyImplyLeading: false,
      // drawer: const ClipRRect(
      //   borderRadius: BorderRadius.only(
      //     topRight: Radius.circular(10.0),
      //     bottomRight: Radius.circular(10.0),
      //   ),
      //   child: NavDrawerLayout(),
      // ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: serviceList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return CardInfoLayout(
                    serviceList: serviceList,
                    indexOfCard: index,
                  );
                },
              );
            },
            child: MyCard(
              name: serviceList[index].name,
              username: serviceList[index].username,
              onPressedDelete: () {
                setState(() {
                  serviceList.removeAt(index);
                });
              },
              onPressedEdit: () async {
                dynamic result = await Navigator.of(context).pushNamed(
                  "/edit",
                  arguments: EditArgs(
                    serviceList[index].name,
                    serviceList[index].username,
                    serviceList[index].password,
                    serviceList[index].otpKey,
                  ),
                );
                if (result == null) return;
                setState(() {
                  serviceList[index] = Service(result["name"],
                      result["username"], result["password"], result["otp"]);
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Builder(
        builder: (BuildContext context) {
          return BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: IconTheme(
              data: IconThemeData(color: Theme.of(context).colorScheme.primary),
              child: Row(
                children: [
                  IconButton(
                    tooltip: AppLocalizations.of(context)!
                        .homeBottomAppBarSettingsTooltip,
                    color: widgetFGColor,
                    onPressed: () {
                      Navigator.pushNamed(context, "/settings");
                    },
                    icon: const Icon(Icons.settings),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        tooltip: AppLocalizations.of(context)!
            .homeBottomAppBarFloatingActionButtonTooltip,
        foregroundColor: widgetFGColor,
        backgroundColor: widgetBGColor,
        onPressed: () async {
          dynamic result = await Navigator.of(context).pushNamed("/add");
          if (result == null) return;
          setState(() {
            serviceList.add(Service(result["name"], result["username"],
                result["password"], result["otp"]));
          });
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
