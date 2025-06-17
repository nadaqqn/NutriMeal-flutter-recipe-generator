import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/meal_model.dart';

class ApiService {
  final String baseUrl = 'https://www.themealdb.com/api/json/v1/1/random.php';

  Future<MealModel> getRandomMeal() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MealModel.fromJson(data['meals'][0]);
    } else {
      throw Exception('Failed to load meal');
    }
  }
}
