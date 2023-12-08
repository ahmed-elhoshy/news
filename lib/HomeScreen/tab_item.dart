import 'package:flutter/material.dart';
import 'package:newsapp/my-theme.dart';

import '../Model/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected;

  Source source;

  TabItem({required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: MyTheme.primaryColor, width: 3),
          color: isSelected ? MyTheme.primaryColor : Colors.transparent),
      child: Text(
        source.name ?? "",
        style: TextStyle(
            fontSize: 18,
            color: isSelected ? MyTheme.whiteColor : MyTheme.primaryColor),
      ),
    );
  }
}
