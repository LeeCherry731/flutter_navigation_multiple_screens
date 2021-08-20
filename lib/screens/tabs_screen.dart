import 'package:flutter/material.dart';
import 'package:flutter_navigation_multiple_screens/screens/categories_screen.dart';
import 'package:flutter_navigation_multiple_screens/screens/favorites_screen.dart';
import 'package:flutter_navigation_multiple_screens/screens/ios_screen.dart';
import 'package:flutter_navigation_multiple_screens/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'page': FavoritesScreen(),
      'title': 'Favorites',
    },
    // {
    //   'page': IosScreen(),
    //   'title': 'Iso',
    // }
  ];

  int _selectedPageIndex = 0;

  @override
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: _selectedPageIndex == 2
          ? null
          : AppBar(
              title: Text(_pages[_selectedPageIndex]['title']),
            ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.black38,
        type: BottomNavigationBarType.shifting,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          // BottomNavigationBarItem(
          //   backgroundColor: Theme.of(context).primaryColor,
          //   icon: Icon(Icons.phone_iphone),
          //   label: 'Ios',
          // ),
        ],
      ),
    );
  }
}
