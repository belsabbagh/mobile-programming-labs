import 'dart:convert';
import 'package:http/http.dart' as http;
import 'expense.dart';

class FirebaseExpenseService {
  final String _firebaseUrl =
      'https://expenses-app-67b71-default-rtdb.europe-west1.firebasedatabase.app/';
  final String _expensesPath = 'expenses';

  // Add an expense to Firebase
  Future<void> addExpense(Expense expense) async {
    final response = await http.post(
      Uri.parse('$_firebaseUrl/$_expensesPath.json'),
      body: jsonEncode(expense.createBody()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to add expense: ${response.body}');
    }
  }

  // Update an expense on Firebase
  Future<void> updateExpense(Expense expense) async {
    final response = await http.put(
      Uri.parse('$_firebaseUrl/$_expensesPath/${expense.id}.json'),
      body: jsonEncode(expense.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update expense: ${response.body}');
    }
  }

  // Delete an expense from Firebase
  Future<void> deleteExpense(String id) async {
    final response = await http.delete(
      Uri.parse('$_firebaseUrl/$_expensesPath/$id.json'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete expense: ${response.body}');
    }
  }

  // Get all expenses from Firebase
  Future<List<Expense>> getExpenses() async {
    final response =
        await http.get(Uri.parse('$_firebaseUrl/$_expensesPath.json'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<Expense> expenses = [];
      data.forEach((key, value) {
        expenses.add(Expense.fromJson(key, value));
      });
      return expenses;
    } else {
      throw Exception('Failed to load expenses: ${response.body}');
    }
  }
}
