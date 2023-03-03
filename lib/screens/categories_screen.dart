import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: DUMMY_CATEGORIES
              .map(
                (catDate) => CategoryItem(
                  id: catDate.id,
                  title: catDate.title,
                  color: catDate.color,
                ),
              )
              .toList()),
    );
  }
}
