import 'package:flutter/material.dart';
import '../app_data.dart';
import '../widgets/categoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        maxCrossAxisExtent: 200,
        childAspectRatio: 7 / 8,
      ),
      children: Categories_data.map((datacat) =>
          CategoryItem(datacat.title, datacat.imageUrl, datacat.id)).toList(),
    );
  }
}
