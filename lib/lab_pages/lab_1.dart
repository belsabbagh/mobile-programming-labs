import 'package:flutter/material.dart';

class Lab1Page extends StatelessWidget {
  const Lab1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 1'),
      ),
      body: Center(
        child: Container(
          child: const Text(
            'This was just a check that we can all use and install and run flutter.',
            style: TextStyle(fontSize: 24.0),
          ),
        ),
      ),
    );
  }
}
