// ignore_for_file: camel_case_types, prefer_interpolation_to_compose_strings, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bread_model.dart';

class breadSpe extends StatelessWidget {
  void Function()? onTap;
  final Bread bread;

  breadSpe({super.key, required this.bread, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(25)),
          margin: const EdgeInsets.only(left: 5),
          padding: EdgeInsets.all(8),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(5)),
              Image.asset(bread.imagePath, height: 140),
              Text(
                bread.name,
                style: GoogleFonts.abel(fontSize: 20),
              ),
              SizedBox(
                width: 160,
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$" + bread.price,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 21),
                    ),
                    Row(
                      children: [
                        Text(bread.rating,
                            style: const TextStyle(fontSize: 14)),
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
