import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import './dummy-data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext ctx) {
    final routeArgs = 
      ModalRoute.of(ctx).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return Text(categoryMeals[index].title);
      }, itemCount: categoryMeals.length , )
    );
  }
}