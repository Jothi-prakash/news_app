import 'package:flutter/material.dart';
import 'package:news_app/data/bookmark_service.dart';
import 'package:news_app/views/headlines/news_deatil_page.dart';
import 'package:share_plus/share_plus.dart';

import '../../model/news_headlines.dart';

class NewsWidgets extends StatefulWidget {
  final Article? article;
  final bool? showBookmarks;

  const NewsWidgets(
      {Key? key, required this.article, required this.showBookmarks})
      : super(key: key);

  @override
  State<NewsWidgets> createState() => _NewsWidgetsState();
}

class _NewsWidgetsState extends State<NewsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsDetailPage(
                    newsUrl: widget.article!.url, title: widget.article!.title),
              ));
        },
        child: Card(
          elevation: 10,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.article!.title!,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: widget.article!.urlToImage != null
                      ? Image.network(
                          widget.article!.urlToImage!,
                          width: 100,
                          height: 100,
                        )
                      : Image.asset(
                          'assets/reporter.jpeg',
                          width: 100,
                          height: 100,
                        ),
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
                          widget.article!.description!,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.article!.getDateString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 126, 122, 122)),
                            ),
                          ),
                          IconButton(
                              onPressed: (() {
                                Share.share(widget.article!.url!);
                              }),
                              icon: const Icon(
                                Icons.share,
                                color: Colors.grey,
                                size: 15,
                              )),
                          widget.showBookmarks! ? getBookmark() : Container()
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  FutureBuilder<bool> getBookmark() {
    return FutureBuilder(
        future: isArticleBookmarked(widget.article!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var hasBookmark = snapshot.data ?? false;
            return IconButton(
                onPressed: (() async {
                  if (hasBookmark) {
                    await removeBookmark(widget.article!);
                  } else {
                    await addBookmark(widget.article!);
                  }
                  setState(() {});
                }),
                icon: Icon(
                  Icons.bookmark,
                  color: hasBookmark ? Colors.red : Colors.grey,
                  size: 15,
                ));
          }
          return const CircularProgressIndicator();
        });
  }
}
