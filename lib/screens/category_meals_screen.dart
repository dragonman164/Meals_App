import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);


  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

String categoryTitle ;
List<Meal> displayedMeals;
var _loadedInitData = false;
  @override
  void initState() {
   //...
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // TODO: implement initState
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryTitle = routeArgs['title'];
      final categoryid = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryid);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }


  void _removeMeal(String mealId){
      setState(() {
        displayedMeals.removeWhere((meal) => meal.id == mealId);
      });
  }
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title']),
      ),
      body: ListView.builder(itemBuilder: (ctx,index) {
       return MealItem(title: displayedMeals[index].title,
       imageUrl: displayedMeals[index].imageUrl,
         duration: displayedMeals[index].duration,
         affordability:displayedMeals[index].affordability,
         complexity: displayedMeals[index].complexity,
         id : displayedMeals[index].id,
         removeItem: _removeMeal,
       );
      },itemCount: displayedMeals.length, ),
    );
  }
}
