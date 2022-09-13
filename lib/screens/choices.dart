// ignore_for_file: use_key_in_widget_constructors, empty_constructor_bodies, prefer_const_constructors

import 'dart:ui';
import 'package:hand_fight/utitlities/game.dart';
import 'package:flutter/material.dart';
import 'package:hand_fight/widgets/gamebuttons.dart';
import 'package:hand_fight/screens/fight_screen.dart';

class ChoicesScreen extends StatefulWidget {
  const ChoicesScreen({Key? key}) : super(key: key);
  // Rounds round;
  @override
  State<ChoicesScreen> createState() => _ChoicesScreenState();
}

class _ChoicesScreenState extends State<ChoicesScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 30;

    return Scaffold(
      body: Stack(children: [
        ClipRRect(
          child: SafeArea(
            child: Stack(children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/pic.jpg',
                  ),
                  fit: BoxFit.cover,
                )),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 7,
                    sigmaY: 7,
                  ),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              )
            ]),
          ),
        ),
        Center(
          child: Container(
              width: MediaQuery.of(context).size.width - 35,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black, width: 5)),
              child: Stack(children: [
                Positioned(
                  top: MediaQuery.of(context).size.width / 2 - 225,
                  left: MediaQuery.of(context).size.width / 2 - 105,
                  child: Hero(
                    tag: "Rock",
                    child: gameButton(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FightScreen(GameChoice("Rock"), '')));
                    }, 'assets/rocki.png', btnWidth),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width / 2 - 85,
                  left: MediaQuery.of(context).size.width / 2 - 25,
                  child: Hero(
                    tag: "Paper",
                    child: gameButton(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FightScreen(GameChoice("Paper"), '')));
                    }, 'assets/paperi.png', btnWidth),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.width / 2 - 85,
                  left: MediaQuery.of(context).size.width / 2 - 185,
                  child: Hero(
                    tag: "Scisors",
                    child: gameButton(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FightScreen(GameChoice("Scisors"), '')));
                    }, 'assets/scissorsi.png', btnWidth),
                  ),
                )
              ])),
        ),
      ]),
    );
  }
}
