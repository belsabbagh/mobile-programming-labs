import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

enum UserRole {
  admin,
  regular,
}

class User {
  final String id;
  final String username;
  final String password;
  final UserRole role; // New property to store user role

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.role,
  });
}

class DataService {
  final Map<String, User> _users = {};
  final _uuid = const Uuid();

  DataService() {
    // Add admin by default
    addUser('admin', 'admin12345', UserRole.admin);
  }

  // Add a user with username, hashed password, and role
  void addUser(String username, String password, UserRole role) {
    final id = _uuid.v4();
    final hashedPassword = _hashPassword(password);
    final newUser =
        User(id: id, username: username, password: hashedPassword, role: role);
    _users[username] = newUser;
  }

  // Check if a user exists with the given username
  bool userExists(String username) {
    return _users.containsKey(username);
  }

  // Check if the provided username and password match
  bool isPasswordCorrect(String username, String password) {
    if (!_users.containsKey(username)) return false;
    final hashedPassword = _users[username]!.password;
    final providedHashedPassword = _hashPassword(password);
    return hashedPassword == providedHashedPassword;
  }

  // Get user role
  UserRole getUserRole(String username) {
    if (!_users.containsKey(username))
      return UserRole.regular; // Default role if user not found
    return _users[username]!.role;
  }

  // Hash password using SHA256
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Iterable<User> usersIter() {
    return _users.values;
  }

  User? getByKey(String key) {
    return _users[key];
  }
}
