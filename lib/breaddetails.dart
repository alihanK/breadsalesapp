import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:salesapp/menu.dart';

import 'bread_model.dart';
import 'shop.dart';

class breadDetails extends StatefulWidget {
  final Bread bread;
  const breadDetails({super.key, required this.bread});

  @override
  State<breadDetails> createState() => _breadDetailsState();
}

class _breadDetailsState extends State<breadDetails> {
  //quantity
  int quantityCount = 0;

  //decrementQuantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //incrementQuantity
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  //add to cart
  void addToCart() {
    //only in the cart if there is something in the cart
    if (quantityCount > 0) {
      //get access to shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addToCart(widget.bread, quantityCount);
      //let the user know it was successfull
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                content: const Text("Succesfully added"),
                actions: [
                  IconButton(
                    onPressed: () {
                      //pop once to remove Dialogbox
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => menuPage()));
                      //pop again to previous screen
                      // Navigator.pop(context);
                    },
                    icon: const Icon(Icons.done),
                  ),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          elevation: 0,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    //bread image
                    Image.asset(widget.bread.imagePath, height: 120),
                    //space
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        //rating
                        Text(
                          widget.bread.rating,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.star, color: Colors.orange),
                        const SizedBox(height: 5),
                      ],
                    ),
                    const SizedBox(height: 5),
                    //bread name
                    Text(
                      widget.bread.name,
                      style:
                          GoogleFonts.abel(color: Colors.black, fontSize: 25),
                    ),
                    const SizedBox(height: 25),
                    //description
                    const Text(
                      'DEFINITION:',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Hot and delicious if you are lucky!",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15, height: 2),
                    )
                  ],
                ),
              ),
            ),

            //price and add cart
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.orange,
              child: Column(
                children: [
                  //price and quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //price
                      Text("${widget.bread.price}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      //quantity
                      Row(
                        children: [
                          //minus
                          Container(
                            padding: const EdgeInsets.only(left: 1),
                            child: IconButton(
                              iconSize: 22,
                              icon: const Icon(
                                Icons.remove_circle,
                                color: Colors.black,
                              ),
                              onPressed: decrementQuantity,
                            ),
                          ),
                          //number of quantity
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 21),
                              ),
                            ),
                          ),
                          //plus
                          Container(
                            padding: const EdgeInsets.only(left: 1),
                            child: IconButton(
                              iconSize: 22,
                              icon: const Icon(Icons.add_circle,
                                  color: Colors.black),
                              onPressed: incrementQuantity,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  //add to cart button
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: addToCart,
                      child: Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
