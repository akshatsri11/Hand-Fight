// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'dart:async';

import 'package:hand_fight/widgets/gamebuttons.dart';
import 'package:hand_fight/utitlities/game.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'choices.dart';

class FightScreen extends StatefulWidget {
  FightScreen(this.gameChoice, this.round, {Key? key}) : super(key: key);
  GameChoice gameChoice;
  String round;
  // Rounds round;

  @override
  State<FightScreen> createState() => _FightScreenState();
}

class _FightScreenState extends State<FightScreen>
    with TickerProviderStateMixin {
  late Animation _animation, animation;
  late AnimationController _controller;

  String? randomChoice() {
    Random random = Random();
    int robotChoiceIndex = random.nextInt(3);
    return Game.choices[robotChoiceIndex];
  }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    _animation = Tween(begin: 2.0, end: 0.65).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    animation = Tween(begin: 2.0, end: 0.638).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));

    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String robotChoice = randomChoice()!;
    String? robotChoicePath;
    switch (robotChoice) {
      case "Rock":
        robotChoicePath = "assets/rock.png";
        break;
      case "Paper":
        robotChoicePath = "assets/paper.png";
        break;
      case "Scisors":
        robotChoicePath = "assets/scissors.png";
        break;
      default:
    }
    String? playerChoice;
    switch (widget.gameChoice.type) {
      case "Rock":
        playerChoice = "assets/rock.png";
        break;
      case "Paper":
        playerChoice = "assets/paper.png";
        break;
      case "Scisors":
        playerChoice = "assets/scissors.png";
        break;
      default:
    }
    // Switch (widget.round.type) {
    //   case "1":
    //     rounds = "1";
    //     break;
    //   case "5":
    //     rounds = "5";
    //     break;
    //   case "10":
    //     rounds = "10";
    //     break;
    //   case "20":
    //     rounds = "20";
    //     break;
    //   default:
    // }tring? rounds;

    if (GameChoice.gameRules[widget.gameChoice.type]![robotChoice] ==
        "You Win") {
      setState(() {
        Game.gameScore++;
      });
    }
    if (GameChoice.gameRules[widget.gameChoice.type]![robotChoice] ==
        "You Lose") {
      setState(() {
        Game.cpScore++;
      });
    }

    final width = MediaQuery.of(context).size.width;
    final w = MediaQuery.of(context).size.width / 10 - 20;
    final w1 = MediaQuery.of(context).size.width / 2 + 65;
    final h = MediaQuery.of(context).size.height / 2 - 30;
    final h1 = MediaQuery.of(context).size.height / 2 - 80;

    Timer(
        const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ChoicesScreen())));

    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, child) {
          return SafeArea(
            child: Scaffold(
              body: Stack(children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/pic.jpg'),
                          fit: BoxFit.cover)),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0.0, _animation.value * width, 0.0),
                  child: Hero(
                      tag: "${widget.gameChoice.type}",
                      child: gameButton(() {}, playerChoice!, width)),
                ),
                RotationTransition(
                  turns: const AlwaysStoppedAnimation(1 / 2),
                  child: Transform(
                      transform: Matrix4.translationValues(
                          0.0, animation.value * width, 0.0),
                      child: Hero(
                          tag: "${widget.gameChoice.type}",
                          child: gameButton(() {}, robotChoicePath!, width))),
                ),
                Transform.translate(
                  offset: Offset(w, h),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 3.5,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      '${Game.gameScore}/${widget.round}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 50.0),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(w1, h1),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 10,
                    width: MediaQuery.of(context).size.width / 3.5,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Text(
                      '${Game.cpScore}/${widget.round}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 50.0),
                    ),
                  ),
                )
              ]),
            ),
          );
        });
  }
}
