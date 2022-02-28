import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeal;

   FavoritesScreen( this.favoriteMeal) ;
  @override
  Widget build(BuildContext context) {
    if(favoriteMeal.isEmpty){
      return Center(
        child: Text("you have no favorites yet _ start adding some!"),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeal[index].id,
            title: favoriteMeal[index].title,
            affordability: favoriteMeal[index].affordability,
            complexity: favoriteMeal[index].complexity,
            duration: favoriteMeal[index].duration,
            imageUrl: favoriteMeal[index].imageUrl,
          );
        },
        itemCount: favoriteMeal.length,
      )
        ;

    }
  }
}
