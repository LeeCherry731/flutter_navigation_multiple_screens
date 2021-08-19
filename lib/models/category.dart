import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category(
      {required this.id, required this.title, this.color = Colors.orange});
}

  // Category(
  //   id: 'c2',
  //   title: 'Quick & Easy',
  //   color: Colors.red,
  // ),