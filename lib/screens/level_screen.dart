// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:hand_fight/screens/choices.dart';

class LevelScreen extends StatefulWidget {
  const LevelScreen({Key? key}) : super(key: key);

  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/pic.jpg"), fit: BoxFit.cover)),
              child: Column(children: [Label(), Levels()]),
            ),
          ),
        ));
  }
}

class Label extends StatelessWidget {
  const Label({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 80, 20, 125),
      // ignore: sort_child_properties_last
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "LEVELS",
          style: TextStyle(
            fontSize: 90,
          ),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.amber,
          border: Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 7),
          borderRadius: BorderRadius.circular(16)),
    );
  }
}

final round = ['1', ' 5', '15', '20'];

class Levels extends StatelessWidget {
  const Levels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 4),
        borderRadius: BorderRadius.circular(50),
        color: Colors.amber,
      ),
      height: MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width - 50,
      child: Stack(children: [
        Transform.translate(
          offset: Offset(-75, 30),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChoicesScreen(),
                ),
              );
            },
            child: Container(
              height: 125,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 231, 248, 80),
              ),
              // ignore: sort_child_properties_last
              child: Text(
                round[0],
                style: TextStyle(
                    fontSize: 60, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(75, 30),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChoicesScreen()));
            },
            child: Container(
              height: 125,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 231, 248, 80),
              ),
              // ignore: sort_child_properties_last
              child: Text(
                round[1],
                style: TextStyle(
                    fontSize: 60, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(-75, 180),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChoicesScreen()));
            },
            child: Container(
              height: 125,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 231, 248, 80),
              ),
              // ignore: sort_child_properties_last
              child: Text(
                round[2],
                style: TextStyle(
                    fontSize: 60, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(75, 180),
          child: RawMaterialButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChoicesScreen()));
            },
            child: Container(
              height: 125,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 231, 248, 80),
              ),
              // ignore: sort_child_properties_last
              child: Text(
                round[3],
                style: TextStyle(
                    fontSize: 60, color: Color.fromARGB(255, 0, 0, 0)),
              ),
              alignment: Alignment.center,
            ),
          ),
        ),
      ]),
    );
  }
}
