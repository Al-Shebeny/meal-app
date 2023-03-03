import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
      {super.key, required this.id, required this.title, required this.color});
  void selectCategory (BuildContext ctx ){
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments:{
      'id':id,
       'title':title
        } );

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(.4), color],
            end: Alignment.bottomRight,
            begin: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.subtitle1,),
      ),
    );
  }
}
