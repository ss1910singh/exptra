// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Expanded(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: [
              Container(
                width: 375,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    Text("Account Balance"),
                    Text("₹1000"),
                    Row(
                      children: [
                        SizedBox(
                          width: 25,
                          height: 200,
                        ),
                        Container(
                          width: 150,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.green,
                          ),
                          child: Column(children: [
                            Text("Income"),
                            Text("₹1500"),
                          ]),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          width: 150,
                          height: 75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.red,
                          ),
                          child: Column(children: [
                            Text("Expanses"),
                            Text("₹500"),
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Container(
                      color: Colors.yellow,
                      child: Row(
                        children: [Text('Recent Transaction'), Text('See all')],
                      ),
                    ),
                    Column(
                      children: [Text('Recent Transaction'), Text('See all')],
                    )
                  ],
                ),
              )
            ],
=======
    return Scaffold(
      body: Container(
        // page container
        child: Container(
          //balance,income,expance card
          width: 350,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.yellow,
>>>>>>> dd053f2309fbc45b004df42e09abb5de0e5468ed
          ),
        ),
      ),
    );
  }
}
