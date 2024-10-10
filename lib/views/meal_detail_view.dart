import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_meal_app/models/meal_model.dart';
import 'package:the_meal_app/providers/favorite_provider.dart';

class MealDetailsView extends StatelessWidget {
  const MealDetailsView({
    super.key,
    required this.meal,
  });

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    //Estancia do provider criado => FavoriteProvider
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    bool isFavorite = favoriteProvider.isFavorite(meal);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Refeição'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4.0,
            color: Colors.grey[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.deepPurple,
                        ),
                        onPressed: () {
                          if (isFavorite) {
                            favoriteProvider.removeFavoriteMeal(meal);
                          } else {
                            favoriteProvider.addFavoriteMeal(meal);
                          }
                        },
                      ),
                    ],
                  ),
                  Image.network(
                    meal.image,
                    width: 300,
                    height: 200,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    meal.title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    meal.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
