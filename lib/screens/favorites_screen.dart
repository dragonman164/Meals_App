import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeal;
  FavoritesScreen(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {
    if(favoritesMeal.isEmpty)
    return Center(
      child: Text('You have no Favorites!! Start Adding Some'),
    );
    else
      return ListView.builder(itemBuilder: (ctx,index) {
        return MealItem(title: favoritesMeal[index].title,
          imageUrl: favoritesMeal[index].imageUrl,
          duration: favoritesMeal[index].duration,
          affordability:favoritesMeal[index].affordability,
          complexity: favoritesMeal[index].complexity,
          id : favoritesMeal[index].id,

        );
      },itemCount: favoritesMeal.length, );
  }
}
