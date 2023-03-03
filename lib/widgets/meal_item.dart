import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageURL;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  //final Function removeItem;

  const MealItem({
    Key? key,
    required this.imageURL,
    required this.title,
    required this.duration,
    required this.affordability,
    required this.complexity,
    required this.id,
    //required this.removeItem,
  }) : super(key: key);
  String get complexityText{
    switch(complexity){
      case Complexity.Simple :return 'Simple';break;
      case Complexity.Challenging :return 'Challenging';break;
      case Complexity.Hard :return 'Hard';break;
      default:return 'UnKnown';break;
    }
  }
  String get affordabilityText{
    switch(affordability){
      case Affordability.Affordable :return 'Affordable';break;
      case Affordability.Pricey :return 'Pricey';break;
      case Affordability.Luxurious :return 'Luxurious';break;
      default:return 'UnKnown';break;
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routeName,arguments : id)
        .then((value) {
         // if(value !=null)return removeItem(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    color: Colors.black45,
                    width: 300,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6,),
                      Text('$duration min'),
                    ],
                  ),
                  Row(children: [
                    const Icon(Icons.work),
                    const SizedBox(width: 6,),
                    Text(complexityText ),
                  ],),
                  Row(children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(width: 6,),
                    Text(affordabilityText),
                  ],),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
