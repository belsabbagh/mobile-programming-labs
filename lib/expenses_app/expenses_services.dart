import 'dart:convert';
import 'package:http/http.dart' as http;
import 'expense.dart';

String defaultGetErrorMessage(response) {
  return "Failed to load: ${response.body}";
}

String defaultPostErrorMessage(response) {
  return "Failed to add: ${response.body}";
}

String defaultPutErrorMessage(response) {
  return "Failed to update: ${response.body}";
}

String defaultDeleteErrorMessage(response) {
  return "Failed to delete: ${response.body}";
}

class RequestHandler {
  // a function that takes a response and returns a string
  String Function(http.Response) getErrorMessageFn = defaultGetErrorMessage;
  String Function(http.Response) postErrorMessageFn = defaultPostErrorMessage;
  String Function(http.Response) putErrorMessageFn = defaultPutErrorMessage;
  String Function(http.Response) deleteErrorMessageFn =
      defaultDeleteErrorMessage;

  RequestHandler({
    this.getErrorMessageFn = defaultGetErrorMessage,
    this.postErrorMessageFn = defaultPostErrorMessage,
    this.putErrorMessageFn = defaultPutErrorMessage,
    this.deleteErrorMessageFn = defaultDeleteErrorMessage,
  });

  Future<String> get(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load expenses: ${response.body}');
    }
  }

  Future<String> post(String url, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(postErrorMessageFn(response));
    }
  }

  Future<String> put(String url, Map<String, dynamic> body) async {
    final response = await http.put(
      Uri.parse(url),
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(putErrorMessageFn(response));
    }
  }

  Future<String> delete(String url) async {
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(deleteErrorMessageFn(response));
    }
  }
}

class FirebaseExpenseService {
  final String _firebaseUrl =
      'https://expenses-app-67b71-default-rtdb.europe-west1.firebasedatabase.app/';
  final String _expensesPath = 'expenses';
  final RequestHandler _requestHandler = RequestHandler();

  Future<void> addExpense(Expense expense) async {
    final url = '$_firebaseUrl/$_expensesPath.json';
    await _requestHandler.post(url, expense.createBody());
  }

  Future<void> updateExpense(Expense expense) async {
    final url = '$_firebaseUrl/$_expensesPath/${expense.id}.json';
    await _requestHandler.put(url, expense.toJson());
  }

  Future<void> deleteExpense(String id) async {
    final url = '$_firebaseUrl/$_expensesPath/$id.json';
    await _requestHandler.delete(url);
  }

  Future<List<Expense>> getExpenses() async {
    final url = '$_firebaseUrl/$_expensesPath.json';
    final json = await _requestHandler.get(url);
    final data = jsonDecode(json) as Map<String, dynamic>;
    return data.entries.map((e) => Expense.fromJson(e.key, e.value)).toList();
  }
}
