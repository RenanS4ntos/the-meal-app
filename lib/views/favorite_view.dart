import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_meal_app/providers/favorite_provider.dart';
import 'package:the_meal_app/views/meal_detail_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    // consumir lista de favoritos

    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Text('Favoritos'),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: favoriteProvider.favoriteMeals.length,
            itemBuilder: (context, index) {
              final meal = favoriteProvider.favoriteMeals[index];

              return GestureDetector(
                onTap: () {
                  // navegar para a página de detalhes
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MealDetailsView(
                        meal: meal,
                      ),
                    ),
                  );
                },
                child: ListTile(
                  tileColor: Colors.grey[800],
                  leading: Image.network(meal.image),
                  title: Text(meal.title),
                  trailing: const Icon(
                    Icons.favorite,
                    color: Colors.deepPurple,
                  ),
                ),
              );
            }));
  }
}
