import 'package:the_meal_app/models/ingredient_model.dart';

class MealModel {
  final String id;
  final String title;
  final String image;
  final String description;
  final String category;
  final List<Ingredient> ingredients;

  MealModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.category,
    required this.ingredients,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredientsList = [];
    for (int i = 1; i <= 20; i++) {
      String ingredientKey = 'strIngredient$i';
      String measureKey = 'strMeasure$i';
      if (json[ingredientKey] != null && json[ingredientKey].isNotEmpty) {
        ingredientsList.add(
            Ingredient.fromJson(json[ingredientKey], json[measureKey] ?? ''));
      }
    }

    return MealModel(
      id: json['idMeal'],
      title: json['strMeal'],
      image: json['strMealThumb'],
      description: json['strInstructions'],
      category: json['strCategory'],
      ingredients: ingredientsList,
    );
  }
}
