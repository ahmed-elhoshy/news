import 'package:flutter/material.dart';
import 'package:newsapp/my-theme.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;

  Function onDrawerClick;

  HomeDrawer({required this.onDrawerClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: MyTheme.primaryColor,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.1),
          width: double.infinity,
          // height: MediaQuery.of(context).size.height*0.15,
          child: Text(
            'News app',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: MyTheme.whiteColor),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            onDrawerClick(HomeDrawer.categories);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.view_list_rounded, size: 35),
                SizedBox(
                  width: 10,
                ),
                Text('Categories',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: MyTheme.blackColor))
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            onDrawerClick(HomeDrawer.settings);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.settings, size: 35),
                SizedBox(
                  width: 10,
                ),
                Text('Settings',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: MyTheme.blackColor))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
