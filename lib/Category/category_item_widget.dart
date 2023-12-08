import 'package:flutter/material.dart';
import 'package:newsapp/Model/category_data.dart';
import 'package:newsapp/my-theme.dart';

class CategoryItem extends StatelessWidget {
  CategoryData categoryData;
  int index;

  CategoryItem({required this.categoryData, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categoryData.color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(index % 2 == 0 ? 20 : 0),
            bottomRight: Radius.circular(index % 2 != 0 ? 20 : 0)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
            child: Image.asset(
              categoryData.imageUrl,
              height: MediaQuery.of(context).size.height * 0.15,
            ),
          ),
          Text(
            categoryData.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: MyTheme.whiteColor, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
