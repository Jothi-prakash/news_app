import 'package:flutter/material.dart';
import 'package:news_app/views/news_details.dart';

import '../../Model/news_headlines.dart';


class NewsWidgets extends StatelessWidget {
final Article? article;

const NewsWidgets({ Key? key, this.article }) : super(key: key);

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
                article!.title!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Colors.black ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article!.description!,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black),
              ),
            ),
            ElevatedButton(onPressed: (() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewsDetails(),));
            }), child:const  Text('Read more'))
          ],
        ),
      ),
    );
  }
}

