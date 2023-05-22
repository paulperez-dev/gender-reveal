import 'package:flutter/material.dart';
import 'package:gender_reveal/eco_screen/eco_screen.dart';
import 'package:gender_reveal/home/view/home_screen.dart';
import 'package:gender_reveal/reveal/reveal_screen.dart';

abstract class Revel {
  static final routes = <String, Widget Function(BuildContext)>{
    HomeScreen.routeName: (context) => const HomeScreen(),
    RevealScreen.routeName: (context) => const RevealScreen(),
    EcoScreen.routeName: (context) => const EcoScreen(),
  };
}
