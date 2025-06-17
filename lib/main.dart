import 'package:flutter/material.dart';
import 'ui/pages/home_page.dart';
import 'ui/themes/app_theme.dart';

void main() {
  runApp(NutriMealApp());
}

class NutriMealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NutriMeal',
      theme: AppTheme.mainTheme,
      home: HomePage(),
    );
  }
}
