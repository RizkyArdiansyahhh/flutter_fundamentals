import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Animation"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: "Profil-Picture",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                width: 200,
                height: 200,
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
      ),
    );
  }
}
