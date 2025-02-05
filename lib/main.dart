import 'package:flutter/material.dart';
import 'package:recap01/recipe/recipe_app/recipe_app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData.dark(),
      home: RecipeApp(),
    );
  }
}



