import 'dart:ui';

import 'package:newsapp/my-theme.dart';

class CategoryData {
  String id;
  String title;
  String imageUrl;
  Color color;

  CategoryData(
      {required this.title,
      required this.id,
      required this.imageUrl,
      required this.color});

// technology

  static List<CategoryData> getCategories() {
    return [
      CategoryData(
          title: 'Sports',
          id: 'sports',
          imageUrl: 'assets/images/ball.png',
          color: MyTheme.redColor),
      CategoryData(
          title: 'General',
          id: 'general',
          imageUrl: 'assets/images/Politics.png',
          color: MyTheme.navyColor),
      CategoryData(
          title: 'Health',
          id: 'health',
          imageUrl: 'assets/images/health.png',
          color: MyTheme.pinkColor),
      CategoryData(
          title: 'Business',
          id: 'business',
          imageUrl: 'assets/images/business.png',
          color: MyTheme.brownColor),
      CategoryData(
          title: 'Entertainment',
          id: 'entertainment',
          imageUrl: 'assets/images/environment.png',
          color: MyTheme.blueColor),
      CategoryData(
          title: 'Science',
          id: 'science',
          imageUrl: 'assets/images/science.png',
          color: MyTheme.yellowColor),
      CategoryData(
          title: 'Technology',
          id: 'technology',
          imageUrl: 'assets/images/science.png',
          color: MyTheme.redColor),
    ];
  }
}
