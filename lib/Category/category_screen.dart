import 'package:flutter/material.dart';
import 'package:newsapp/Category/category_item_widget.dart';
import 'package:newsapp/Model/category_data.dart';

/// Category Fragment
class CategoryScreen extends StatelessWidget {
  var categoriesList = CategoryData.getCategories();
  Function onCategoryClick;

  CategoryScreen({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Pick your category \nof interest',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    /// 3adad el col. f kol row
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onCategoryClick(categoriesList[index]);
                    },
                    child: CategoryItem(
                        categoryData: categoriesList[index], index: index),
                  );
                },
                itemCount: categoriesList.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
