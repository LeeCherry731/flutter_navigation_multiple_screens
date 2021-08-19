// main.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_multiple_screens/screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // hide the debug banner
      debugShowCheckedModeBanner: false,
      title: "Kindacode.com",
      home: CategoriesScreen(),
    );
  }
}
