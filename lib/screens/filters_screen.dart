import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegetarian = false;
  bool _Vegan = false;

  @override
  initState() {
    _GlutenFree =widget.currentFilters['GlutenFree'];
    _LactoseFree =widget.currentFilters['LactoseFree'];
    _Vegetarian = widget.currentFilters['Vegetarian'];
    _Vegan = widget.currentFilters['Vegan'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function ubdateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: ubdateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final Map<String, bool> selctedFilters = {
                  'GlutenFree': _GlutenFree,
                  'LactoseFree': _LactoseFree,
                  'Vegan': _Vegan,
                  'Vegetarian': _Vegetarian,
                };
                widget.saveFilters(selctedFilters);
              })
        ],
        title: Text('Your Filters'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              buildSwitchListTile(
                "Gluten-Free",
                "only include gluten-free meals",
                _GlutenFree,
                (newValue) {
                  setState(() {
                    _GlutenFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                "Lactose-Free",
                "only include Lactose-free meals",
                _LactoseFree,
                (newValue) {
                  setState(() {
                    _LactoseFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                "Vegetarian",
                "only include Vegetarian meals",
                _Vegetarian,
                (newValue) {
                  setState(() {
                    _Vegetarian = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                "Vegan",
                "only include Vegan meals",
                _Vegan,
                (newValue) {
                  setState(() {
                    _Vegan = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
