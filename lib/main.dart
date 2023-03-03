import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterDate) {
    setState(() {
      filters = filterDate;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorites(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: const TextTheme(
            subtitle2: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold),
            subtitle1: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold),
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
          )),
      home: TabsScreen(favoriteMeals: _favoriteMeals),

      routes: {
        '/2': (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        '/1': (context) => const CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen(_toggleFavorite, _isMealFavorites),
        FilterScreen.routeName: (context) =>
            FilterScreen(saveFilters: _setFilters, currentFilters: filters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meal'),
        ),
        body: const CategoriesScreen());
  }
}
