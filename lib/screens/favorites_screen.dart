import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals ;
  const FavoritesScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(
        child: Text('no'),
      );
    }
    else{
      return  ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            imageURL: favoriteMeals[index].imageUrl,
            title: favoriteMeals[index].title,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
            id:favoriteMeals[index].id,
           // removeItem: _removeMeal,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
