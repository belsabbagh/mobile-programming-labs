import 'package:flutter/material.dart';
import 'package:mobile_labs/lab_5/data_service.dart';
import 'package:mobile_labs/lab_5/user_page.dart';

class RegularHomePage extends StatelessWidget {
  final User user;

  RegularHomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Regular Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user.username}!'),
            ElevatedButton(
              onPressed: () {
                // View profile action for regular user
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UserProfilePage(user: user)),
                );
              },
              child: Text('View Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
