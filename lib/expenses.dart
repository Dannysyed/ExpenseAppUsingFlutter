import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  const Expense({super.key});

  @override
  State<Expense> createState() {
    return _Expense();
  }
}

class _Expense extends State<Expense> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text("asd"), Text("Expense")],
      ),
    );
  }
}
