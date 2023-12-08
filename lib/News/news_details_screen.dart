import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/NewsResponse.dart';
import '../my-theme.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routename = 'news_details_screen';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
            Text(news.author ?? "",
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(
              height: 10,
            ),
            Text(news.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w500)),
            SizedBox(
              height: 10,
            ),
            Text(news.content ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 18, fontWeight: FontWeight.w400)),
            SizedBox(
              height: 14,
            ),
            Text(news.publishedAt ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 16),
                textAlign: TextAlign.end),
            SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () => launchNewsUrl(news.url ?? ""),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('View full article',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 15)),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> launchNewsUrl(String url) async {
    var uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch');
    }
  }
}
