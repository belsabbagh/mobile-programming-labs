// expense.dart
class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  Expense copyWith({
    String? id,
    String? title,
    double? amount,
    DateTime? date,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
    );
  }

  factory Expense.fromJson(String key, Map<String, dynamic> json) {
    return Expense(
      id: key,
      title: json['title'],
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }

  Map<String, dynamic> createBody() {
    return {
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
    };
  }
}
