// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'menu.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myScreen(),
    );
  }
}

class myScreen extends StatelessWidget {
  const myScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 226, 191, 137),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Welcome to BREAD APP ',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                Text('Types of bread',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Image.asset('images/butterbread.png', height: 300, width: 300),
                SizedBox(height: 50),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => menuPage()));
                    },
                    child: Text(
                      "LET'S GET STARTED",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
