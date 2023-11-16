import 'package:flutter/material.dart';
import 'package:recipe_and_meal_planner/models/recipe.dart';
import 'package:recipe_and_meal_planner/screens/recipe_details_screen.dart';
import 'package:recipe_and_meal_planner/services/auth_service.dart';
import 'package:recipe_and_meal_planner/services/recipe_service.dart';
import 'package:recipe_and_meal_planner/widgets/recipe_card.dart';


class HomeScreen extends StatelessWidget {
  final RecipeService _recipeService = RecipeService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await _logout(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to Shopping List screen
              Navigator.pushNamed(context, '/shoppingList');
            },
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              // Navigate to Meal Planner screen
              Navigator.pushNamed(context, '/mealPlanner');
            },
          ),
          IconButton(
            icon: Icon(Icons.upload),
            onPressed: () {
              // Navigate to Recipe Upload screen
              Navigator.pushNamed(context, '/uploadRecipe');
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Recipe>>(
        future: _recipeService.getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Recipe> recipes = snapshot.data ?? [];
            return ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return RecipeCard(
                  recipe: recipes[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeDetailsScreen(
                          recipeId: recipes[index].id,
                          recipe: recipes[index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    await _authService.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }
}
