import 'package:flutter/material.dart';

const black = Color(0xFF000000);
const yellow = Color(0xFFFFF700);

Map<int, Color> yellowMap = {
  50: const Color.fromRGBO(255, 247, 0, .1),
  100: const Color.fromRGBO(255, 247, 0, .2),
  200: const Color.fromRGBO(255, 247, 0, .3),
  300: const Color.fromRGBO(255, 247, 0, .4),
  400: const Color.fromRGBO(255, 247, 0, .5),
  500: const Color.fromRGBO(255, 247, 0, .6),
  600: const Color.fromRGBO(255, 247, 0, .7),
  700: const Color.fromRGBO(255, 247, 0, .8),
  800: const Color.fromRGBO(255, 247, 0, .9),
  900: const Color.fromRGBO(255, 247, 0, 1),
};

MaterialColor yellowMaterialColor = MaterialColor(0xFFFFF700, yellowMap);
