import 'package:flutter/material.dart';
import 'package:mobile_labs/lab_pages/lab_1.dart';
import 'package:mobile_labs/lab_pages/lab_2.dart';
import 'package:mobile_labs/lab_pages/lab_3.dart';
import 'package:mobile_labs/lab_pages/lab_4.dart';
import 'package:mobile_labs/lab_pages/lab_5.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LabIndexPage(),
    );
  }
}

class LabIndexPage extends StatelessWidget {
  LabIndexPage({super.key});

  final Map<String, Widget> labPages = {
    "Lab 1": const Lab1Page(),
    'Lab 2': const Lab2Page(),
    'Lab 3': Lab3Page(),
    'Lab 4': Lab4Page(),
    "Lab 5": Lab5Page(),
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
