import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Lab2Page());
  }
}

class NameAndDescription extends StatelessWidget {
  // takes in a name and description to display
  final String name;
  final String description;
  const NameAndDescription(
      {Key? key, required this.name, required this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        Text(description),
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String description;
  final String address;
  final String phone;
  const ProfileCard(
      {Key? key,
      this.name = "Your Name",
      this.description = "Your Description",
      this.address = "Your Address",
      this.phone = "Your Phone"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // Choose your border color
          width: 1, // Choose your border width
        ),
        borderRadius: BorderRadius.circular(10), // Choose your border radius
      ),
      padding: EdgeInsets.all(10), // Optional: Add padding inside the container
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 50,
              ),
              SizedBox(width: 10),
              NameAndDescription(
                name: name,
                description: description,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(address),
              Spacer(),
              Text(phone),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.accessibility),
              Icon(Icons.timer),
              Icon(Icons.phone_android),
              Icon(Icons.phone_iphone),
            ],
          ),
        ],
      ),
    );
  }
}

class Lab2Page extends StatelessWidget {
  const Lab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 2'),
      ),
      body: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return a row of cards
    return ListView(
      children: const [
        ProfileCard(
          name: "John Doe",
          description: "Software Developer",
          address: "123 Main Street",
          phone: "123-456-7890",
        ),
        ProfileCard(
          name: "Jane Smith",
          description: "Senior Software Developer",
          address: "456 Main Street",
          phone: "123-456-7890",
        ),
        ProfileCard(
          name: "John Doe",
          description: "Software Developer",
          address: "123 Main Street",
          phone: "123-456-7890",
        ),
      ],
    );
  }
}
