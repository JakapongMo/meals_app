import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy-data.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // For make this component run only first time
    if (!_loadedInitData) {
      final routeArgs = 
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext ctx) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
        return MealItem(
          id: displayMeals[index].id,
          title: displayMeals[index].title,
          imageUrl: displayMeals[index].imageUrl,
          duration: displayMeals[index].duration,
          affordability: displayMeals[index].affordability,
          complexity: displayMeals[index].complexity,
          removeItem: _removeMeal,
          );
      }, itemCount: displayMeals.length , )
    );
  }
}