class MealModel {
  final String name;
  final String imageUrl;
  final List<String> ingredients;
  final String instructions;

  MealModel({
    required this.name,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient != '') {
        ingredients.add('$measure $ingredient');
      }
    }

    return MealModel(
      name: json['strMeal'],
      imageUrl: json['strMealThumb'],
      instructions: json['strInstructions'],
      ingredients: ingredients,
    );
  }
}
