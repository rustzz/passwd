import 'package:flutter/material.dart';
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

class HomeState extends State<Home> {

	List<Service> serviceList = [];

	@override
	void initState() {
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				shadowColor: Colors.transparent,
				title: const Text("passwd"),
				centerTitle: true,
			),
			body: ListView.builder(
				itemCount: serviceList.length,
				itemBuilder: (BuildContext context, int index) {
					return Card(
						child: Column(
							children: [
								ListTile(
									title: Text(serviceList[index].name),
									subtitle: Text(serviceList[index].username),
								),
								Row(
									children: [
										IconButton(
											onPressed: () {
												setState(() {
													serviceList.removeAt(index);
												});
											},
											icon: const Icon(Icons.delete),
										),
										IconButton(
											onPressed: () async {
												dynamic result = await Navigator.of(context).pushNamed(
													"/edit",
													arguments: EditArgs(
														serviceList[index].name, serviceList[index].username,
														serviceList[index].password, serviceList[index].otp,
													),
												);
												setState(() {
													serviceList[index] = (Service(result["name"], result["username"], result["password"], result["otp"]));
												});
											},
											icon: const Icon(Icons.edit),
										),
									],
								),
							],
						),
					);
				},
			),
			bottomNavigationBar: BottomAppBar(
				shape: const CircularNotchedRectangle(),
				child: Container(height: 50.0),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () async {
					dynamic result = await Navigator.of(context).pushNamed("/add");
					setState(() {
						serviceList.add(Service(result["name"], result["username"], result["password"], result["otp"]));
					});
				},
				child: const Icon(Icons.add),
			),
			floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
		);
	}
}