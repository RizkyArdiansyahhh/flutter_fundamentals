import 'package:flutter/material.dart';
import 'package:flutter_application_2/Models/Money.dart';
import 'package:flutter_application_2/Models/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Cart()),
          ChangeNotifierProvider(create: (context) => Money())
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text("Multi Provider"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Balance : ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.teal,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.teal.shade100,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Money>(
                          builder: (context, money, _) => Text(
                            (money.balance.toString()),
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.teal),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Consumer<Cart>(
                      builder: (context, cart, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Apple(500) x ${cart.quantity}",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            (500 * cart.quantity).toString(),
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) => Consumer<Cart>(
              builder: (context, cart, _) => FloatingActionButton(
                onPressed: () {
                  if (money.balance >= 500) {
                    money.balance -= 500;
                    cart.quantity += 1;
                  }
                },
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
