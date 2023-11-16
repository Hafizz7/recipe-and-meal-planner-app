import 'package:flutter/material.dart';
import 'package:recipe_and_meal_planner/models/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailsScreen({required this.recipe, required String recipeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                recipe.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Text('Description:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(recipe.description),
              Text('Ingredients:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              _buildList(recipe.ingredients),
              SizedBox(height: 16),
              Text('Instructions:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              _buildList(recipe.instructions),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
        );
      },
    );
  }
}
