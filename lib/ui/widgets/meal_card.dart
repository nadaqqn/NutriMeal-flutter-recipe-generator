import 'package:flutter/material.dart';
import '../../models/meal_model.dart';

class MealCard extends StatelessWidget {
  final MealModel meal;

  const MealCard({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Column(
        children: [
          Image.network(meal.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              meal.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: meal.ingredients.map((e) => Text("• $e")).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
