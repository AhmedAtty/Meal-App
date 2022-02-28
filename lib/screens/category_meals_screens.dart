import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreens extends StatefulWidget {
  static const routeName = 'category_meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreens(this.availableMeals);

  @override
  _CategoryMealsScreensState createState() => _CategoryMealsScreensState();
}

class _CategoryMealsScreensState extends State<CategoryMealsScreens> {
  String categoryTitle;
  List<Meal> displayedMeals;
  Color catergoryColor;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final catrgoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    catergoryColor = routeArg['color'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(catrgoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: catergoryColor,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
// Column(
// children: <Widget>[
// Text(
// catrgoryMeals[index].title,
// ),
// ],
// );
