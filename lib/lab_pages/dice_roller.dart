import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class DiceRoller {
  final Random _random = Random();

  int roll() => _random.nextInt(6) + 1;

  Image rollImg() => Image.file(File("assets/images/dice-${roll()}.png"));
}

class DiceRollerPage extends StatefulWidget {
  const DiceRollerPage({super.key});

  @override
  State<DiceRollerPage> createState() => _DiceRollerPageState();
}

class _DiceRollerPageState extends State<DiceRollerPage> {
  DiceRoller roller = DiceRoller();
  Image dieFace = Image.file(File("assets/images/dice-1.png"));
  void _incrementCounter() {
    setState(() {
      dieFace = roller.rollImg();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice Roller"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have rolled this:',
            ),
            dieFace,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Roll',
        child: const Icon(Icons.loop),
      ),
    );
  }
}
