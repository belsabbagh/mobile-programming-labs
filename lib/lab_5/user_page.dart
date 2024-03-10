import 'package:flutter/material.dart';
import 'package:mobile_labs/lab_5/data_service.dart';

class UserProfilePage extends StatelessWidget {
  final User user;

  UserProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Uuid: ${user.id}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Username: ${user.username}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Role: ${user.role == UserRole.admin ? 'Admin' : 'Regular'}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
