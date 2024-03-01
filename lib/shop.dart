import 'package:flutter/material.dart';

import 'bread_model.dart';

class Shop extends ChangeNotifier {
  final List<Bread> _breadList = [
    Bread(
        name: "Croissant",
        price: "5 dollars",
        imagePath: "images/croissant.png",
        rating: "5.0"),
    Bread(
        name: "Round Bread",
        price: "2 dollars",
        imagePath: "images/roundbread.png",
        rating: "4.0"),
    Bread(
        name: "Toast Bread",
        price: "1 dollar",
        imagePath: "images/toastbread.png",
        rating: "4.8"),
    Bread(
        name: "Butter Bread",
        price: "3 dollars",
        imagePath: "images/butterbread.png",
        rating: "4.2"),
    Bread(
        name: "Baguette",
        price: "12 dollars",
        imagePath: "images/baguette.png",
        rating: "5.0"),
  ];
  //customer cart
  List<Bread> _cart = [];

  //getter methods
  List<Bread> get breadList => _breadList;
  List<Bread> get cart => _cart;

  //add to cart
  void addToCart(Bread breadList, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(breadList);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Bread bread) {
    _cart.remove(bread);
    notifyListeners();
  }
}
