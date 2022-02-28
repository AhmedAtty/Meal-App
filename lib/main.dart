import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_meals_screens.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MealApp());

class MealApp extends StatefulWidget {
  @override
  _MealAppState createState() => _MealAppState();
}

class _MealAppState extends State<MealApp> {
  Map<String, bool> _filters = {
    'GlutenFree': false,
    'LactoseFree': false,
    'Vegan': false,
    'Vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFilters(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['GlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['GlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['GlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['GlutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);

    if (existingIndex>=0){
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id){
    return _favoriteMeal.any((meal) => meal.id == id) ;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
          )),
      // home: MyMealApp(),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => TabsScreen(_favoriteMeal),
        CategoryMealsScreens.routeName: (context) =>
            CategoryMealsScreens(_availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
    );
  }
}

class MyMealApp extends StatefulWidget {
  @override
  _MyMealAppState createState() => _MyMealAppState();
}

class _MyMealAppState extends State<MyMealApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meal App",
        ),
      ),
      body: null,
    );
  }
}
