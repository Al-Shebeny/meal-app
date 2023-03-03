import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen(
      {super.key, required this.saveFilters, required this.currentFilters});

  static const routeName = '/filter';
  final void Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['gluten']!;
    _isLactoseFree = widget.currentFilters['lactose']!;
    _isVegan = widget.currentFilters['vegan']!;
    _isVegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Function save =widget.saveFilters;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                Map<String, bool> selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegan': _isVegan,
                  'vegetarian': _isVegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection ',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                'Gluten-free',
                'Only include gluten free meals.',
                _isGlutenFree,
                (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                'Lactose-free',
                'Only include lactose free meals.',
                _isLactoseFree,
                (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegetarian',
                'Only include vegetarian meals.',
                _isVegetarian,
                (newValue) {
                  setState(() {
                    _isVegetarian = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegan',
                'Only include vegan meals.',
                _isVegan,
                (newValue) {
                  setState(() {
                    _isVegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: const MainDrawer(),
    );
  }

  late Function() updateValue;

  Widget buildSwitchListTile(
      String title, String subTitle, bool currentValue, updateValue) {
    return SwitchListTile(
        value: currentValue,
        title: Text(title),
        subtitle: Text(subTitle),
        onChanged: updateValue);
  }
}
