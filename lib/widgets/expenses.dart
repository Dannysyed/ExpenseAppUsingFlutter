import 'package:expense_tracker/widgets/expense_list/expense_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() {
    return _Expense();
  }
}

class _Expense extends State<Expense> {
  final List<Expenses> _registeredExpense = [
    Expenses(
        title: "Flutter",
        amount: 12,
        category: Category.work,
        date: DateTime.now()),
    Expenses(
        title: "Movie",
        amount: 12,
        category: Category.leisure,
        date: DateTime.now()),
    Expenses(
        title: "Canada",
        amount: 12,
        category: Category.travel,
        date: DateTime.now())
  ];
  void _getModaloverlay() {
    showModalBottomSheet(context: context, builder: (ctx) => const Text("his"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome to ExpenseTracker"),
          actions: [
            IconButton(onPressed: _getModaloverlay, icon: const Icon(Icons.add))
          ],
        ),
        body: ExpensesList(
          registeredExpenses: _registeredExpense,
        ));
  }
}
