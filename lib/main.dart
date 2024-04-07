import 'package:flutter/material.dart';
import 'package:mobile_labs/lab_pages/dice_roller.dart';
import 'package:mobile_labs/lab_pages/expenses_app.dart';
import 'package:mobile_labs/lab_pages/lab_1.dart';
import 'package:mobile_labs/lab_pages/lab_2.dart';
import 'package:mobile_labs/lab_pages/lab_3.dart';
import 'package:mobile_labs/lab_pages/lab_4.dart';
import 'package:mobile_labs/lab_pages/lab_5.dart';
import 'package:mobile_labs/lab_pages/lab_6.dart';

import 'package:mobile_labs/lab_pages/meal_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Programming Labs',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: LabIndexPage(),
    );
  }
}

class LabIndexPage extends StatelessWidget {
  LabIndexPage({super.key});

  final Map<String, Widget> labPages = {
    "Dice Roller": const DiceRollerPage(),
    "Meal App": const CategoryMealWidget(),
    "Expenses App": const ExpensePage(),
    "Lab 1": const Lab1Page(),
    'Lab 2': const Lab2Page(),
    'Lab 3': const Lab3Page(),
    'Lab 4': const Lab4Page(),
    "Lab 5": Lab5Page(),
    "Lab 6": const Lab6Page(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mobile Programming Labs Index'),
      ),
      body: ListView.builder(
        itemCount: labPages.length,
        itemBuilder: (context, index) {
          var lab = labPages.entries.elementAt(index);
          return ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => lab.value),
              );
            },
            child: Text(lab.key),
          );
        },
      ),
    );
  }
}
