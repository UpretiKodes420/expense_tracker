import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

final uuid = Uuid();
final formatter = DateFormat.yMd();

enum Category { food, travel, entertainment, family, work, rent, education }

const categoryIcon = {
  Category.food:Icons.dining_outlined,
  Category.travel:Icons.flight_takeoff_outlined,
  Category.entertainment:Icons.movie_creation_outlined,
  Category.family:Icons.family_restroom_outlined,
  Category.work:Icons.work_outlined,
  Category.rent:Icons.home_outlined,
  Category.education:Icons.school_outlined
};

class Expense {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final Category category;

  Expense({
    required this.amount,
    required this.title,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  String get getFormattedDate {
    return formatter.format(date);
  }
}
