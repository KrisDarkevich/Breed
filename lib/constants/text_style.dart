import 'package:cat_breeds/constants/colors.dart';
import 'package:flutter/material.dart';

abstract class BreedsText {
  static const mainScreenName = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: BreedColors.nameColor,
  );
  static const mainScreenLearn = TextStyle(
    fontSize: 10,
  );
  static const mainCardFirst = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(225, 105, 19, 38),
  );
  static const mainCardLast = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Color.fromARGB(224, 154, 78, 113),
  );
}
