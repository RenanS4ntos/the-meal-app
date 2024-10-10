import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_meal_app/constants/styles.dart';
import 'package:the_meal_app/providers/favorite_provider.dart';
import 'package:the_meal_app/providers/meals_provider.dart';
import 'package:the_meal_app/views/signin_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MealProvider(),
        )
      ],
      child: MaterialApp(
        title: 'The Meal App',
        theme: appTheme,
        home: const SignInView(),
      ),
    );
  }
}
