import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

import '../models/meal.dart';
import "./categories_screen.dart";
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen({Key? key, required this.favoriteMeals}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _page;

  @override
  void initState() {
    _page = [
      {'page': const CategoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
        'title': 'Your Favorites'
      },
    ];
    super.initState();
  }

  static int _selectedPageIndex = 0;

  void _selectedPage(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedPageIndex]['title'].toString()),
      ),
      body: _page[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          onTap: _selectedPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            )
          ]),
      drawer: const MainDrawer(),
    );
  }
}
