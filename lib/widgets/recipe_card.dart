import 'package:flutter/material.dart';
import 'package:recipe_and_meal_planner/models/recipe.dart';
import 'package:recipe_and_meal_planner/services/meal_planner_service.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final VoidCallback onTap;
  // final ShoppingListService _shoppingListService = ShoppingListService();
  final MealPlannerService _mealPlannerService = MealPlannerService();

  RecipeCard({required this.recipe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(recipe.title),
        subtitle: Text(recipe.description),
        onTap: onTap,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // IconButton(
            //   icon: Icon(Icons.add_shopping_cart),
            //   onPressed: () async {
            //     DateTime selectedDate = DateTime.now();
            //     _mealPlannerService.addToMealPlanner(recipe.id, selectedDate);

            //     await _shoppingListService.addToShoppingList(recipe.id);

            //     ScaffoldMessenger.of(context).showSnackBar(
            //       SnackBar(
            //         content:
            //             Text('Recipe added to meal planner and shopping list.'),
            //       ),
            //     );
            //   },
            // ),
            IconButton(
              icon: Icon(Icons.event),
              onPressed: () {
                _showDatePicker(context, recipe);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context, Recipe recipe) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (selectedDate != null) {
      TimeOfDay? selectedDateTime =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());

      _mealPlannerService.addToMealPlanner(recipe.id, selectedDate);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Recipe added to meal planner on $selectedDateTime'),
        ),
      );
    }
  }
}
