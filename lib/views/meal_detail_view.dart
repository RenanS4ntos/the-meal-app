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
            elevation: 5,
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
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(8.0), // Arredondar a borda em 8px
                    child: Image.network(
                      meal.image,
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
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
                  const SizedBox(height: 16),
                  const Text(
                    'Ingredients',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: meal.ingredients.length,
                    itemBuilder: (context, index) {
                      final ingredient = meal.ingredients[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              ingredient.name,
                              style: const TextStyle(fontSize: 16),
                            ),
                            Text(
                              ingredient.measure,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      );
                    },
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
