import 'package:flutter/material.dart';
import 'package:mobile_labs/expenses_app/create_expense_page.dart';
import 'package:mobile_labs/expenses_app/edit_expense_page.dart';
import 'package:mobile_labs/expenses_app/expense.dart';
import 'package:mobile_labs/expenses_app/expenses_services.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  final FirebaseExpenseService _firebaseExpenseService =
      FirebaseExpenseService();
  List<Expense> _expenses = [];

  @override
  void initState() {
    super.initState();
    _loadExpenses();
  }

  Future<void> _loadExpenses() async {
    try {
      final expenses = await _firebaseExpenseService.getExpenses();
      setState(() {
        _expenses = expenses;
      });
    } catch (e) {
      print('Failed to load expenses: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Manager'),
      ),
      body: ListView.builder(
        itemCount: _expenses.length,
        itemBuilder: (context, index) {
          final expense = _expenses[index];
          return ListTile(
            title: Text(expense.title),
            subtitle: Text('\$${expense.amount} - ${expense.date.toString()}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteExpense(expense.id),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => _navigateToEditExpensePage(expense),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddExpensePage,
        child: const Icon(Icons.add),
      ),
    );
  }

  // Method to navigate to create expense page
  void _navigateToAddExpensePage() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const CreateExpensePage()),
    );
    _loadExpenses(); // Reload expenses after returning from create expense page
  }

  void _navigateToEditExpensePage(Expense expense) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => EditExpensePage(expense: expense)),
    );
    _loadExpenses();
  }

  Future<void> _deleteExpense(String id) async {
    try {
      await _firebaseExpenseService.deleteExpense(id);
      _loadExpenses();
    } catch (e) {
      print('Failed to delete expense: $e');
    }
  }
}
