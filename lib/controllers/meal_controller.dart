import '../models/meal_model.dart';
import '../services/api_service.dart';

class MealController {
  final ApiService apiService = ApiService();
  MealModel? currentMeal;

  Future<void> fetchRandomMeal() async {
    currentMeal = await apiService.getRandomMeal();
  }
}
