import 'package:flutter/material.dart';
import 'package:flutter_navigation_multiple_screens/dummy_datas/dummy_data.dart';
import 'package:flutter_navigation_multiple_screens/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
            .map(
              (e) => CategoryItem(
                id: e.id,
                title: e.title,
                color: e.color,
              ),
            )
            .toList(),
      ),
    );
  }
}
