import 'package:flutter/material.dart';
import 'package:mobile_labs/lab_5/data_service.dart';
import 'package:mobile_labs/lab_5/user_page.dart';

class UserListPage extends StatelessWidget {
  final DataService dataService;

  UserListPage({required this.dataService});

  @override
  Widget build(BuildContext context) {
    List<User> userList = dataService.usersIter().toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(userList[index].username),
            onTap: () {
              // Navigate to user profile page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfilePage(user: userList[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
