import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.restaurant),
            title: const Text(
              'Meal',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {Navigator.of(context).pushReplacementNamed('/2');},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Filters',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);},
          ),
        ],
      ),
    );
  }
}
