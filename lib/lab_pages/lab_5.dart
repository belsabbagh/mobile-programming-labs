import 'package:flutter/material.dart';
import 'package:mobile_labs/lab_5/admin_home_page.dart';
import 'package:mobile_labs/lab_5/data_service.dart';
import 'package:mobile_labs/lab_5/register_page.dart';
import 'package:mobile_labs/lab_5/regular_home_page.dart';

class Lab5Page extends StatelessWidget {
  final DataService dataService;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  Lab5Page({super.key, 
    DataService? dataService,
    TextEditingController? usernameController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
  })  : dataService = dataService ?? DataService(),
        usernameController = usernameController ?? TextEditingController(),
        passwordController = passwordController ?? TextEditingController(),
        confirmPasswordController =
            confirmPasswordController ?? TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;
                if (dataService.userExists(username) &&
                    dataService.isPasswordCorrect(username, password)) {
                  // Navigate based on user role
                  final userRole = dataService.getUserRole(username);
                  switch (userRole) {
                    case UserRole.admin:
                      final admin = dataService.getByKey(username)!;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminHomePage(
                            admin: admin,
                            dataService: dataService,
                          ),
                        ),
                      );
                      break;
                    case UserRole.regular:
                      final user = dataService.getByKey(username)!;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegularHomePage(user: user),
                        ),
                      );
                      break;
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Login Failed'),
                        content: const Text('Invalid username or password.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterPage(
                      dataService: dataService,
                      usernameController: TextEditingController(),
                      passwordController: TextEditingController(),
                      confirmPasswordController: TextEditingController(),
                    ),
                  ),
                );
              },
              child: const Text('Don\'t have an account? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
