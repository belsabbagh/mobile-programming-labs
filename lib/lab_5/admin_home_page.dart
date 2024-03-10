import 'package:flutter/material.dart';
import 'package:mobile_labs/lab_5/data_service.dart';
import 'package:mobile_labs/lab_5/users_index.dart';

class AdminHomePage extends StatelessWidget {
  final User admin;
  final DataService dataService;

  AdminHomePage({required this.admin, required this.dataService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${admin.username}!'),
            ElevatedButton(
              onPressed: () {
                // List users action for admin
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserListPage(dataService: dataService)),
                );
              },
              child: Text('List Users'),
            ),
          ],
        ),
      ),
    );
  }
}
