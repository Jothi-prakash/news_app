import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/screens/home_screen.dart';

class NewsApp extends StatelessWidget {
const NewsApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
     SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'My News Friend', 
      home: HomeScreen(),
    );
  }
}