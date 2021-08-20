// main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_multiple_screens/dummy_datas/dummy_data.dart';
import 'package:flutter_navigation_multiple_screens/models/meal.dart';
import 'package:flutter_navigation_multiple_screens/screens/categories_screen.dart';
import 'package:flutter_navigation_multiple_screens/screens/category_meals_screen.dart';
import 'package:flutter_navigation_multiple_screens/screens/filters_screen.dart';
// import 'package:flutter_navigation_multiple_screens/screens/ios_screen.dart';
import 'package:flutter_navigation_multiple_screens/screens/meal_detail_screen.dart';
import 'package:flutter_navigation_multiple_screens/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] as bool && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['lactose'] as bool && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegan'] as bool && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] as bool && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // hide the debug banner
      debugShowCheckedModeBanner: false,
      title: "Kindacode.com",
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Color(0xFFFF6F00),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FiltersScreen.routeName: (ctx) =>
            FiltersScreen(saveFilters: _setFilters, currentFilters: _filters),
        // IosScreen.routeName: (ctx) => IosScreen(),
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        // return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
