import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passwd/activities/edit.dart';

class Service {
  final String name;
  final String username;
  final String password;
  final String otp;

  Service(this.name, this.username, this.password, this.otp);
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  List<Service> serviceList = [];
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
    return Scaffold(
      drawer: ClipRRect(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        child: Drawer(
          child: ListView(
            children: [
              // const DrawerHeader(
              //   child: Text("Passwd"),
              // ),
              ListTile(
                title: const Text("Passwd"),
                onTap: () {
                  //
                },
              ),
              ListTile(
                title: const Text("Настройки"),
                onTap: () {
                  //
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Passwd"),
        centerTitle: true,
      ),
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
                                              Text(serviceList[index].name),
                                          onTap: () {
                                            Clipboard.setData(
                                              ClipboardData(
                                                  text:
                                                      serviceList[index].name),
                                            );
                                          },
                                        ),
                                        ListTile(
                                          title: const Text("Пользователь"),
                                          subtitle:
                                              Text(serviceList[index].username),
                                          onTap: () {
                                            Clipboard.setData(
                                              ClipboardData(
                                                text:
                                                    serviceList[index].username,
                                              ),
                                            );
                                          },
                                        ),
                                        ListTile(
                                          title: const Text("Пароль"),
                                          subtitle:
                                              const Text("• • • • • • • •"),
                                          onTap: () {
                                            Clipboard.setData(
                                              ClipboardData(
                                                text:
                                                    serviceList[index].password,
                                              ),
                                            );
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: ListTile(
                                                title: const Text("Ключ"),
                                                subtitle: Text(
                                                    serviceList[index].otp),
                                                onTap: () {
                                                  Clipboard.setData(
                                                    ClipboardData(
                                                      text: serviceList[index]
                                                          .otp,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(15),
                                              child: CircularProgressIndicator(
                                                value:
                                                    passwordTimeLineController
                                                        .value,
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
                },
              );
              // showMenu(serviceList[index]);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(serviceList[index].name),
                    subtitle: Text(serviceList[index].username),
                  ),
                  Row(
                    children: [
                      IconButton(
                        tooltip: "Удалить",
                        onPressed: () {
                          setState(() {
                            serviceList.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      ),
                      IconButton(
                        tooltip: "Изменить",
                        onPressed: () async {
                          dynamic result =
                              await Navigator.of(context).pushNamed(
                            "/edit",
                            arguments: EditArgs(
                              serviceList[index].name,
                              serviceList[index].username,
                              serviceList[index].password,
                              serviceList[index].otp,
                            ),
                          );
                          setState(() {
                            serviceList[index] = (Service(
                                result["name"],
                                result["username"],
                                result["password"],
                                result["otp"]));
                          });
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                ],
              ),
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
                    tooltip: "Меню",
                    color: const Color(0xFFFFFFFF),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  )
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        tooltip: "Добавить",
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFF424242),
        onPressed: () async {
          dynamic result = await Navigator.of(context).pushNamed("/add");
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
