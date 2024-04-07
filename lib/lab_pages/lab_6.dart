import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_labs/firebase_options.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class AuthenticatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Authenticated Page'),
    ));
  }
}

class _AuthPageState extends State<AuthPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the home page or next screen
      // Replace `HomePage()` with your desired home screen widget
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthenticatedPage()),
      );
    } catch (e) {
      print('Failed to sign in: $e');
      // Handle sign-in errors here
      // For example, show an error message to the user
    }
  }

  Future<void> _signUpWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // Navigate to the home page or next screen after sign-up
      // Replace `HomePage()` with your desired home screen widget
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Lab6Page()),
      );
    } catch (e) {
      print('Failed to sign up: $e');
      // Handle sign-up errors here
      // For example, show an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Auth Demo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _signInWithEmailAndPassword,
                  child: Text('Sign In'),
                ),
                ElevatedButton(
                  onPressed: _signUpWithEmailAndPassword,
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Lab6Page extends StatefulWidget {
  const Lab6Page({Key? key}) : super(key: key);

  @override
  _Lab6PageState createState() => _Lab6PageState();
}

class _Lab6PageState extends State<Lab6Page> {
  FirebaseApp? _firebaseApp;
  @override
  void initState() {
    super.initState();
    initializeFirebase().then((_) => setState(() {}));
  }

  Future<void> initializeFirebase() async {
    _firebaseApp = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 6'),
      ),
      body: AuthPage(),
    );
  }
}
