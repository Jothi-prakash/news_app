import 'package:flutter/material.dart';
import 'package:news_app/News_Models/news_feeds.dart';
import 'package:news_app/constraints/constraint_colors.dart';

class NewsWidgets extends StatelessWidget {
NewsFeeds newsfeed;

const NewsWidgets({ Key? key, this.newsfeed }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 6,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsfeed!.name!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:newsBlack ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsfeed!.description!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: newsBlack),
              ),
            )
          ],
        ),
      ),
    );
  }
}

