import 'package:flutter/material.dart';
import 'package:flutter_application_2/post_result_model.dart';
import 'package:flutter_application_2/user_model.dart';
import 'package:flutter_application_2/users.model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PostResult? postResult;
  User? user;
  List<Users>? users;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            try {
              var result = await Users.getUsers(2);

              setState(
                () {
                  users = result;
                },
              );
            } catch (e) {
              print("error $e");
            }
          },
          child: Text("Get Data"),
        ),
        appBar: AppBar(
          title: const Text("Consume API"),
        ),
        body: (users != null)
            ? ListView.builder(
                itemCount: users!.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: (users!.isNotEmpty &&
                                  users?[index].linkImage != null)
                              ? DecorationImage(
                                  image: NetworkImage(
                                      users?[index].linkImage ?? ""),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                      ),
                      Text(users?[index].name ?? "Anonymous"),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  );
                })
            : Center(child: Text("No Data")),
      ),
    );
  }
}
