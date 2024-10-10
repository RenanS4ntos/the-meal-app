import 'package:flutter/material.dart';
import 'package:the_meal_app/controller/meal_controller.dart';
import 'package:the_meal_app/models/meal_model.dart';

class MealProvider extends ChangeNotifier {
  final MealController _mealController = MealController();
  List<MealModel> _meals = [];
  bool _isLoading = false;
  bool _error = false;

  List<MealModel> get meals => _meals;
  bool get isLoading => _isLoading;
  bool get error => _error;

  Future<void> fetchMeals() async {
    try {
      _isLoading = true;
      final List<MealModel> meals = await _mealController.fetchMeals();

      print(meals);

      _meals = meals;
    } catch (e) {
      _error = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  MealProvider() {
    fetchMeals();
  }
}
