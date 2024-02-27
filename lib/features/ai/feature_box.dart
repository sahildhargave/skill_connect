import './pallete.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String description;
  const FeatureBox(
      {super.key,
      required this.color,
      required this.headerText,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 45,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            )),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10).copyWith(
              left: 15,
            ),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(headerText,
                        style: TextStyle(
                          fontFamily: "Cera Pro",
                          color: Pallete.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ))),
                const SizedBox(height: 2),
                Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(description,
                        style: const TextStyle(
                          fontFamily: "Cera Pro",
                          color: Pallete.blackColor,
                        ))),
              ],
            )));
  }
}
