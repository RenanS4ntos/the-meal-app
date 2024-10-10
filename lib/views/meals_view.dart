import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_meal_app/providers/meals_provider.dart';
import 'package:the_meal_app/views/meal_detail_view.dart';
import 'package:the_meal_app/views/widgets/category_widget.dart';

class MealsView extends StatefulWidget {
  const MealsView({super.key});

  @override
  State<MealsView> createState() => _MealsViewState();
}

class _MealsViewState extends State<MealsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mealProvider = Provider.of<MealProvider>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Text('Refeições'),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: mealProvider.meals.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MealDetailsView(
                                meal: mealProvider.meals[index],
                              ),
                            ),
                          );
                        },
                        child: CategoryWidgetView(
                          meal: mealProvider.meals[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )));
  }
}
