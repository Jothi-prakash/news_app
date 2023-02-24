import 'package:flutter/material.dart';
import 'package:news_app/model/news_headlines.dart';



// ignore: must_be_immutable
class NewsWidgets extends StatelessWidget {
  Article newsHeadlines;

 NewsWidgets({ Key? key, required this.newsHeadlines }) : super(key: key);

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
                newsHeadlines.title!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Colors.black ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                newsHeadlines.description!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}

