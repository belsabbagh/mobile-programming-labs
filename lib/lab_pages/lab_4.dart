import 'package:flutter/material.dart';
import 'dart:math';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/1339433.png',
      height: 500,
      width: 500,
    );
  }
}

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  int randomNumber = 0;
  String collectedData = '';
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void generateRandomNumber() {
    final random = Random();
    setState(() {
      randomNumber = random.nextInt(999) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: generateRandomNumber,
            child: const Text('Generate ID'),
          ),
          const SizedBox(height: 10),
          Text(
            'Random ID: $randomNumber',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                collectedData =
                    'Username: ${usernameController.text}\nPassword: ${passwordController.text}\nRandom ID: $randomNumber';
              });
            },
            child: const Text('OK'),
          ),
          const SizedBox(height: 20),
          Text(
            collectedData,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

class Lab4Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random ID Generator'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.green], // Adjust colors as needed
          ),
        ),
        child: Column(
          children: [
            BackgroundImage(), // Background image widget
            Center(
              child: UserForm(), // User form widget
            ),
          ],
        ),
      ),
    );
  }
}
