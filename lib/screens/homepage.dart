// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hand_fight/screens/round_screen.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/pic.jpg"), fit: BoxFit.cover)),
            //
            child: Column(children: [
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Rules(),
                      ),
                    );
                  },
                  child: Container(
                    //
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 10, 3),
                      child: Text(
                        'HAND FIGHT',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 90,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    margin: EdgeInsets.fromLTRB(100, 60, 15, 240),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3)),
                  ),
                ),
              ),
              Stack(children: [
                Container(
                  child: Lottie.asset("assets/ani1.json",
                      alignment: Alignment.bottomRight),
                  height: MediaQuery.of(context).size.height / 2.5 - 26,
                  alignment: Alignment.bottomRight,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  // ignore: deprecated_member_use
                  child: Container(
                    child: RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LevelScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'PLAY',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 90,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 3)),
                  ),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}

class Rules extends StatelessWidget {
  const Rules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
    double w = MediaQuery.of(context).size.width / 2 - 60;

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
        Column(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 50, 0, 0),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(color: Colors.black, width: 3),
                        shape: BoxShape.circle),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 50, 20, 80),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "RULES",
                      style: TextStyle(
                        fontSize: 90,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      border: Border.all(
                          color: Color.fromARGB(255, 0, 0, 0), width: 7),
                      borderRadius: BorderRadius.circular(16)),
                ),
              ],
            ),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black, width: 5)),
                  child: Stack(children: [
                    Positioned(
                      top: MediaQuery.of(context).size.width / 2 - 210,
                      left: MediaQuery.of(context).size.width / 2 - 100,
                      child: Image.asset(
                        'assets/rocki.png',
                        width: btnWidth,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width / 2.5,
                      left: MediaQuery.of(context).size.width / 2 - 10,
                      child: Image.asset(
                        'assets/scissorsi.png',
                        width: btnWidth,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width / 1.3,
                      left: MediaQuery.of(context).size.width / 4,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(120 / 360),
                        child: Image.asset(
                          'assets/arrow.png',
                          width: w,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width / 4,
                      left: MediaQuery.of(context).size.width / 2 + 25,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(10 / 360),
                        child: Image.asset(
                          'assets/arrow.png',
                          width: w,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width / 5,
                      left: MediaQuery.of(context).size.width / 30 - 10,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(230 / 360),
                        child: Image.asset(
                          'assets/arrow.png',
                          width: w,
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width / 2.5,
                      left: MediaQuery.of(context).size.width / 30,
                      child: Image.asset(
                        'assets/paperi.png',
                        width: btnWidth,
                      ),
                    )
                  ])),
            ),
          ],
        ),
      ]),
    );
  }
}
