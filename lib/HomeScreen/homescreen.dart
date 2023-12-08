import 'package:flutter/material.dart';
import 'package:newsapp/Category/category_details.dart';
import 'package:newsapp/Category/category_screen.dart';
import 'package:newsapp/HomeScreen/home_drawer.dart';
import 'package:newsapp/Model/category_data.dart';
import 'package:newsapp/Settings/settings.dart';
import 'package:newsapp/my-theme.dart';

import 'news_search_delegate.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/pattern.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: HomeDrawer(onDrawerClick: onDrawerItemClick),
          ),
          appBar: AppBar(
            title: Text(selectedDrawerItem == HomeDrawer.settings
                ? 'Settings'
                : selectedCategory == null
                    ? 'News'
                    : selectedCategory!.title),
            toolbarHeight: 50,
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: InkWell(
                    onTap: () => showSearch(
                        context: context, delegate: NewsSearchDelegate()),
                    child: Icon(
                      Icons.search,
                      size: 25,
                    )),
              )
            ],
          ),
          body: selectedDrawerItem == HomeDrawer.settings
              ? Settings()
              : selectedCategory == null
                  ? CategoryScreen(onCategoryClick: onCategoryClick)

                  /// refrence msh call .. msh ana el bnady
                  : CategoryDetails(categoryData: selectedCategory!),
        )
      ],
    );
  }

  CategoryData? selectedCategory;

  void onCategoryClick(CategoryData newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedDrawerItem = HomeDrawer.categories;

  void onDrawerItemClick(int newSelectedDrawerItem) {
    selectedDrawerItem = newSelectedDrawerItem;
    selectedCategory = null;

    /// very important
    Navigator.pop(context);
    setState(() {});
  }
}
