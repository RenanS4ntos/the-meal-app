import 'package:flutter/material.dart';
import 'package:the_meal_app/constants/styles.dart';
import 'package:the_meal_app/models/meal_model.dart';

class CategoryWidgetView extends StatelessWidget {
  final MealModel meal;

  const CategoryWidgetView({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.2),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.deepPurple, width: 2),
      ),
      margin: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            height: 80,
            width: 100,
            meal.image,
          ),
          Text(
            meal.title,
            style: AppStyles.itensTitle,
            textAlign: TextAlign.center, // Alinha o texto ao centro
          ),
        ],
      ),
    );
  }
}
