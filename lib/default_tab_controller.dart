import 'package:flutter/material.dart';
// import 'package:flutter_application_2/main_page.dart';

class DefaultTabControllerWidget extends StatelessWidget {
  const DefaultTabControllerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tab Bar"),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.shop),
            ),
            Tab(
              icon: Icon(Icons.account_box),
            ),
            Tab(
              icon: Icon(Icons.settings),
            )
          ]),
          backgroundColor: Colors.amberAccent,
        ),
        body: TabBarView(children: [
          Text("Home Page"),
          Text("Shop Page"),
          Text("Account Page"),
          Text("Setting Page"),
        ]),
      ),
    );
  }
}
