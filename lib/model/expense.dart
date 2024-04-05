import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatedDate = DateFormat.yMd();

enum Category { food, leisure, work, travel }

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight,
  Category.work: Icons.work
};

class Expenses {
  Expenses(
      {required this.amount,
      required this.title,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount; // for interger like 33.2
  final DateTime date;
  final Category category;

  String get formatedDateGetter {
    return formatedDate.format(date);
  }
}
