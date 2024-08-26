import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

//Uuid package is used to generate ids

const uuid = Uuid();
//uuid is an object of the class Uuid

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel:Icons.flight_takeoff,
  Category.leisure:Icons.movie,
  Category.work:Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  ///In summary, uuid.v4() is used to generate a random Version 4 UUID, and id = uuid.v4();
  ///assigns this generated UUID to the variable id for further use in your Dart application.

  /// id is initialized using Dart initializer.This can be used to initialize class properties
  /// ('like id ') with values that are not recieved as constructor function arguments

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String  get formattedDate{
    return formatter.format(date);
  }
}

class ExpenseBucket{
  const ExpenseBucket({
    required this.category,
    required this.expenses,
});

  ExpenseBucket.forCategory(List<Expense> allExpenses,this.category)
      : expenses=allExpenses
      .where((expense) => expense.category==category).toList();
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    //getter
    double sum = 0;

    for (final expense in expenses){
      sum +=expense.amount;
    }

      return sum;
  }
}