import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/news_headlines.dart';

class NewsWidgets extends StatelessWidget {
  final Article? article;

  const NewsWidgets({Key? key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 10,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              article!.title!,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              article!.urlToImage != null
                  ? Image.network(
                      article!.urlToImage!,
                      width: 100,
                      height: 100,
                    )
                  : Image.asset(
                      'assets/news.png',
                      width: 70,
                      height: 100,
                    ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        article!.description!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        article!.getDateString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: (() {
                    Share.share(article!.url!);
                  }),
                  icon: const Icon(Icons.share))
            ],
          ),
        ]),
      ),
    );
  }
}
