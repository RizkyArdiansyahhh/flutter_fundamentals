import 'package:flutter/material.dart';
import 'package:flutter_application_2/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (comtext) => SecondPage()));
        },
        child: Hero(
          tag: "Profil-Picture",
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.cyanAccent,
              ),
              child: Image(
                  image: NetworkImage(
                      "https://cdn.shopify.com/s/files/1/0720/5919/1615/files/230921_goyounjung_moving_1024x1024.jpg?v=1695329879"),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
