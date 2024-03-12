import 'package:flutter/material.dart';
import 'package:mobile_labs/expenses_app/expense.dart';
import 'package:mobile_labs/expenses_app/expenses_services.dart';

class CreateExpensePage extends StatefulWidget {
  @override
  _CreateExpensePageState createState() => _CreateExpensePageState();
}

class _CreateExpensePageState extends State<CreateExpensePage> {
  final FirebaseExpenseService _firebaseExpenseService =
      FirebaseExpenseService();

  final _formKey = GlobalKey<FormState>();
  late String _title;
  late double _amount;
  late DateTime _date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Please enter a valid amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  _amount = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || DateTime.tryParse(value) == null) {
                    return 'Please enter a valid date';
                  }
                  return null;
                },
                onSaved: (value) {
                  _date = DateTime.parse(value!);
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        final newExpense = Expense(
          id: "0", // Provide a temporary ID (actual ID will be assigned by Firebase)
          title: _title,
          amount: _amount,
          date: _date,
        );
        await _firebaseExpenseService.addExpense(newExpense);
        Navigator.of(context).pop(); // Go back to the previous page
      } catch (e) {
        print('Failed to add expense: $e');
      }
    }
  }
}
