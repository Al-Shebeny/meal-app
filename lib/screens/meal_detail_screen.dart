import 'package:flutter/material.dart';
import '../dummy_data.dart';
class MealDetailScreen extends StatelessWidget {
  final void Function(String mealId) toggleFavorite;
  final bool Function(String id) isMealFavorites;
   const MealDetailScreen( this.toggleFavorite, this.isMealFavorites, {super.key}) ;
  static const routeName = 'meal_detail';

  @override
  Widget build(BuildContext context) {
    final mealId =ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal =DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body:SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.network(selectMeal.imageUrl,fit: BoxFit.cover,),
          ),
          buildSectionTitle(context,'Ingredients'),
          buildContainer(ListView.builder(
            itemBuilder:(ctx , index)=>Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                child: Text(selectMeal.ingredients[index],
                  style: Theme.of(context).textTheme.subtitle1,),
              ),

            ) ,
            itemCount:selectMeal.ingredients.length ,
          ) ,),
          buildSectionTitle(context, 'Steps'),
          buildContainer(ListView.builder(
            itemBuilder:(ctx , index)=>Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index+1}'),
                  ),
                  title: Text(selectMeal.steps[index]),
                ),
                Divider(),
              ],
            ),
            itemCount:selectMeal.steps.length ,
          ) ,),




        ],),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>toggleFavorite(mealId),
      child:  Icon(isMealFavorites(mealId)?Icons.star:Icons.star_border_outlined),
      ),
    );
  }

  Container buildContainer(Widget child) {
    return Container(
        height: 150,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin:const EdgeInsets.all(10),
        padding:const EdgeInsets.all(10),
        child:child,
      );
  }

  Container buildSectionTitle(BuildContext context,String title) {
    return Container(
        margin:const EdgeInsets.symmetric(vertical: 10),
        child: Text(title,style: Theme.of(context).textTheme.subtitle2,),
      );
  }
}
