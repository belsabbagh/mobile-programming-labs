import 'package:flutter/material.dart';

class Lab3Page extends StatefulWidget {
  const Lab3Page({super.key});

  // Renamed from MyHomePage to Lab3Page
  @override
  _Lab3PageState createState() => _Lab3PageState();
}

class MyHomePageDefaultStyles {
  static InputDecoration inputDecoration = const InputDecoration(
    labelText: 'Name',
    border: OutlineInputBorder(),
  );

  static ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red),
  );

  static TextStyle textStyle = const TextStyle(fontSize: 20.0);

  static SizedBox sizedBox = const SizedBox(height: 20.0);

  static EdgeInsets padding = const EdgeInsets.all(16.0);

  static Text appBarText = const Text('Enter your name:');

  static Text greetButtonText = const Text('Greet');

  static Text clearButtonText = const Text('Clear');
}

class _Lab3PageState extends State<Lab3Page> {
  // Renamed from _MyHomePageState to _Lab3PageState
  String textValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyHomePageDefaultStyles.appBarText,
      ),
      body: Padding(
        padding: MyHomePageDefaultStyles.padding,
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (value) {
                setState(() {
                  textValue = value;
                });
              },
              decoration: MyHomePageDefaultStyles.inputDecoration,
            ),
            MyHomePageDefaultStyles.sizedBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Hello, $textValue!')),
                    );
                  },
                  child: MyHomePageDefaultStyles.greetButtonText,
                ),
                MyHomePageDefaultStyles.sizedBox,
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.red),
                  ),
                  onPressed: () {
                    setState(() {
                      textValue = '';
                    });
                  },
                  child: MyHomePageDefaultStyles.clearButtonText,
                ),
              ],
            ),
            MyHomePageDefaultStyles.sizedBox,
            Text(
              'Result: $textValue',
              style: MyHomePageDefaultStyles.textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
