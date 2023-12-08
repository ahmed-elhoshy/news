import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/News/news_details_screen.dart';
import 'package:newsapp/my-theme.dart';

import '../Model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(NewsDetailsScreen.routename, arguments: news),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: MyTheme.primaryColor,
                )),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.author ?? "",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              height: 10,
            ),
            Text(news.title ?? "",
                style: Theme.of(context).textTheme.titleMedium),
            SizedBox(
              height: 10,
            ),
            Text(
              news.publishedAt ?? "",
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
