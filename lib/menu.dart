// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'breaddetails.dart';
import 'breadspecial.dart';
import 'cart.dart';
import 'shop.dart';

class menuPage extends StatefulWidget {
  const menuPage({super.key});

  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  //define to details page
  void navigateToBreadDetails(int index) {
    //get the shop and it's menu
    final shop = context.read<Shop>();
    final breadList = shop.breadList;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => breadDetails(
          bread: breadList[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get the shop and it's menu
    final shop = context.read<Shop>();
    final breadList = shop.breadList;
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu, color: Colors.orange),
        title: Text(
          'BreadAPP',
          style: TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(
            iconSize: 22,
            icon: const Icon(Icons.shopping_cart, color: Colors.red),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => cartPage()));
            },
          ),
          // IconButton(onPressed: (){}, icon: Icons.shopping_cart)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30)),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BUTTERBREAD DISCOUNT %50",
                        style: GoogleFonts.abel(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          //button
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor: Colors.red),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => menuPage()));
                            },
                            child: const Text(
                              "BUTTERBREAD",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 5),
                          //image
                          Image.asset(
                            'images/butterbread.png',
                            height: 50,
                            width: 70,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orangeAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search bar, you can use this.."),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'TYPES OF BREAD',
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.red, fontSize: 20),
            ),
          ),
          const SizedBox(height: 3),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: breadList.length,
            itemBuilder: (context, index) => breadSpe(
              bread: breadList[index],
              onTap: () => navigateToBreadDetails(index),
            ),
          )),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 12, top: 2),
            child: Text(
              'THE MOST SUGGESTED BREAD',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          const SizedBox(height: 5),
          //popular bread
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //image
                Image.asset('images/baguette.png', height: 60),
                const SizedBox(width: 5),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //name
                    Text(
                      'Baguette BREAD',
                      style: GoogleFonts.aboreto(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 5),
                    //price
                    const Text(
                      '\$12.00',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(width: 10),
                const Icon(Icons.favorite_border_outlined, size: 30)
              ],
            ),
          )
        ],
      ),
    );
  }
}
