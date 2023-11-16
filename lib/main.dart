import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recipe_and_meal_planner/firebase_options.dart';
import 'package:recipe_and_meal_planner/screens/authentication/login_screen.dart';
import 'package:recipe_and_meal_planner/screens/authentication/registration_screen.dart';
import 'package:recipe_and_meal_planner/screens/home_screen.dart';
import 'package:recipe_and_meal_planner/screens/meal_planner_screen.dart';
import 'package:recipe_and_meal_planner/screens/recipe_upload_screen.dart';
import 'package:recipe_and_meal_planner/screens/shopping_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe and Meal Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegistrationScreen(),
        '/home': (context) => HomeScreen(),
        '/shoppingList': (context) => ShoppingListScreen(),
        '/mealPlanner': (context) => MealPlannerScreen(),
        '/uploadRecipe': (context) => RecipeUploadScreen(),
      },
    );
  }
}
