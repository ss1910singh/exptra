import 'package:exptra/expense/category.dart';

class Expense {
  final double amount;
  final ExpenseCategory category;
  final DateTime createdOn;
  final String description;

  Expense({required this.amount, required this.category, required this.createdOn, required this.description});

  @override
  String toString() {
    return "Expense(amount = $amount, category = $category, createdOn = $createdOn description = '$description')";
  }
}
