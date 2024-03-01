import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bread_model.dart';
import 'shop.dart';

class cartPage extends StatelessWidget {
  const cartPage({super.key});

  void removeFromCart(Bread bread, BuildContext context) {
    //get access to shop
    final shop = context.read<Shop>();
    //remove from cart
    shop.removeFromCart(bread);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.amberAccent[400],
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.orange,
          title: const Text('CART'),
        ),
        body: ListView.builder(
            itemCount: value.cart.length,
            itemBuilder: (context, index) {
              //get bread from CART
              final Bread bread = value.cart[index];
              //get bread name
              final String breadName = bread.name;
              //get bread price
              final String breadPrice = bread.price;

              //return list title
              return Container(
                decoration: BoxDecoration(
                    color: Colors.orangeAccent[100],
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 20, top: 20, right: 20),
                child: ListTile(
                  title: Text(breadName),
                  subtitle: Text(breadPrice),
                  trailing: IconButton(
                    iconSize: 22,
                    icon: const Icon(Icons.delete),
                    onPressed: () => removeFromCart(bread, context),
                  ),
                ),
              );
            }),
        //PAY BUTTON
        floatingActionButton: Container(
          padding: EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.purple,
              onPressed: () {},
              icon: Icon(Icons.cached),
              label: Text("PAY NOW"),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
