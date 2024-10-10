//Vou gerenciar o estado de uma lista de favoritos no app

import 'package:flutter/material.dart';
import 'package:the_meal_app/models/meal_model.dart';

class FavoriteProvider extends ChangeNotifier {
//Crio a lista ou qq variavel que eu  queira observar o estado
//Quando o estado for modificado, eu NOTIFICO a arvore de widgets!

//Quais os estados??
//1. Se é favorito  => bool
//2.Lista de favoritos

  final List<MealModel> _favoriteMeals = [];

  //Pegar a lista de favoritos

  List<MealModel> get favoriteMeals => _favoriteMeals;

  //Add um produto aos favoritos

  void addFavoriteMeal(MealModel meal) {
    if (!_favoriteMeals.contains(meal)) {
      _favoriteMeals.add(meal);

      notifyListeners();
    }
  }

  void removeFavoriteMeal(MealModel meal) {
    _favoriteMeals.remove(meal);
    //Importante para a arvore de wigets saber da alteracao!!
    notifyListeners();
  }

  bool isFavorite(MealModel meal) {
    return _favoriteMeals.contains(meal);
  }
}
