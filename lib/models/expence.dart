//create a unique id usinfg uuid
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

part 'expence.g.dart';

final uuid = const Uuid().v4();

final famattedDate = DateFormat.yMd();

// enum for category
enum Category { food, travel, leasure, work }

final CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leasure: Icons.leave_bags_at_home_rounded,
  Category.travel: Icons.travel_explore,
  Category.work: Icons.work,
};

@HiveType(typeId: 1)
class ExpenceModel {
  //constructor
  ExpenceModel(
      {required this.amount,
      required this.date,
      required this.title,
      required this.category})
      : id = uuid;

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final Category category;

  //getter > formated date
  String get getFormatedDate {
    return famattedDate.format(date);
  }
}
