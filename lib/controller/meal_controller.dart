import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_meal_app/models/meal_model.dart';

class MealController with ChangeNotifier {
  Future<List<MealModel>> fetchMeals() async {
    String baseUrl = 'https://www.themealdb.com/api/json/v1/1/search.php?s=';
    final url = Uri.parse('$baseUrl');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      List<dynamic> categories = jsonData['meals'];

      return categories.map((meal) => MealModel.fromJson(meal)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }
}
