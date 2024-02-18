import 'package:flutter/material.dart';

// TODO: Dealing with custom categories
enum ExpenseCategory {
  home('Home', Icon(Icons.home)),
  shopping('Shopping', Icon(Icons.shopping_bag)),
  food('Food', Icon(Icons.fastfood)),
  transportation('Transportation', Icon(Icons.train));

  const ExpenseCategory(this.string, this.icon);
  final String string;
  final Icon icon;
}
