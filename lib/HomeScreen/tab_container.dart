import 'package:flutter/material.dart';
import 'package:newsapp/HomeScreen/tab_item.dart';
import 'package:newsapp/News/news_container.dart';

import '../Model/SourceResponse.dart';

class TabContainer extends StatefulWidget {
  List<Source> sourcesList;

  TabContainer({required this.sourcesList});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                isScrollable: true,
                indicatorColor: Colors.transparent,
                tabs: widget.sourcesList
                    .map((source) => TabItem(
                        isSelected:
                            selectedIndex == widget.sourcesList.indexOf(source),
                        source: source))
                    .toList()),
            Expanded(
                child: NewsContainer(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}
