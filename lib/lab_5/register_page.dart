import 'package:flutter/material.dart';
import 'package:mobile_labs/lab_5/data_service.dart';

class RegisterPage extends StatelessWidget {
  final DataService dataService;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  RegisterPage({
    required this.dataService,
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text;
                final password = passwordController.text;
                final confirmPassword = confirmPasswordController.text;
                if (password == confirmPassword) {
                  // For simplicity, registering regular users only. You can extend this to choose role during registration.
                  dataService.addUser(username, password, UserRole.regular);
                  // Navigate to login screen after successful registration
                  Navigator.pop(context);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Registration Failed'),
                        content: Text('Passwords do not match.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
