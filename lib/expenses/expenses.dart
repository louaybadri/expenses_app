
import 'package:flutter/material.dart';

class Expense {
 final String title;
 final double amount;
 final TimeOfDay date;
 Expense({required this.title, required this.amount, required this.date, });

 @override
  String toString() {
    return 'Expense{title: $title, amount: $amount, date: $date}';
  }
}