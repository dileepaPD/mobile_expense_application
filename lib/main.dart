import 'package:expence_blaster_yt/models/expence.dart';
import 'package:expence_blaster_yt/pages/expences.dart';
import 'package:expence_blaster_yt/server/categories_adapter.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenceModelAdapter());
  Hive.registerAdapter(CategoriesAdapter());
  await Hive.openBox("expenceDatabase");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Expences());
  }
}
