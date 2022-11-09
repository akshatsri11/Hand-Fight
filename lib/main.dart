// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:hand_fight/screens/fight_screen.dart';
import 'package:hand_fight/screens/choices.dart';
import 'package:hand_fight/screens/homepage.dart';
import 'screens/round_screen.dart';
import 'package:hand_fight/utitlities/game.dart';

void main() {
  runApp(const HandFight());
}

class HandFight extends StatelessWidget {
  const HandFight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
